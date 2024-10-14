"""
Script uses plane segmentation to get the target object by splitting with the obtained plane as the base
"""
import numpy as np
import open3d as o3d
import argparse

def plane_segmentation(path):
    # create point cloud object
    pcd = o3d.io.read_point_cloud(path)

    # Perform plane segmentation using ransac
    plane_model, inliers = pcd.segment_plane(distance_threshold=0.01, ransac_n=3, num_iterations=10000)

    # obtain the plane equation in the form of: ax + by + cz + -d = 0
    # [a,b,c,d] => plane_model
    plane_eqn=plane_model

    # get the inlier and outlier point clouds
    inlier_cloud=pcd.select_by_index(inliers)
    outlier_cloud=pcd.select_by_index(inliers, invert=True)

    return plane_eqn, inlier_cloud, outlier_cloud

def get_target_mesh(path,plane_eq):
    # create triangular mesh object
    mesh =  o3d.io.read_triangle_mesh(path)

    # define vertices variable
    vertices=np.asarray(mesh.vertices)

    # get the distance of each vertice from the segmented plane
    distances = np.dot(vertices, plane_eq[:3]) + plane_eq[3]

    # separate the distances of each vertice as either 
    # being positive or negative to the plane
    # then split the mesh with the indices
    positive_indices = np.where(distances > 0)[0]
    negative_indices = np.where(distances < 0)[0]
    mesh_positive = mesh.select_by_index(positive_indices)
    mesh_negative = mesh.select_by_index(negative_indices)

    if len(positive_indices) < len(negative_indices):
        smaller_mesh = mesh_positive 
        larger_mesh = mesh_negative 
    else:
        smaller_mesh = mesh_negative
        larger_mesh = mesh_positive

    return smaller_mesh, larger_mesh

# Define the path variable

parser = argparse.ArgumentParser()
parser.add_argument('-p', '--path', type=str)

args = parser.parse_args()
path = args.path

filetype = 'ply'
model_path = path
output_name= f'cleaned_mesh.{filetype}'

eqn, plane_pcd, object_pcd = plane_segmentation(model_path)
smaller_mesh, larger_mesh = get_target_mesh(model_path, eqn)
o3d.io.write_triangle_mesh(output_name,  smaller_mesh, print_progress=True)