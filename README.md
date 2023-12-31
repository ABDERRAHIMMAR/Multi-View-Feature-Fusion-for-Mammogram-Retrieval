**# Multi-View Feature Fusion based on Canonical Correlation Analysis for Mammogram Retrieval**

This project implements a multi-view feature fusion method based on Canonical Correlation Analysis (CCA) for mammogram retrieval. The code is written in Matlab version 2018.

**## File Structure**

The project is organized as follows:

- **radom_forest.m**: This file contains the code for classifying different distances obtained after fusing multi-view features using the Random Forest algorithm.

- **calculsimilarite.m**: This script calculates the similarity between different images in the database and the query image. It uses the fused distances to determine the images most similar to the query image.

- **select_classe.m**: This file is responsible for selecting the query image from the database. It may also include mechanisms to filter images based on certain criteria.
  
- **ccaFusevv.m**: This file containt de CCA function to fuse features

- **"Feature Extraction" Folder**: This folder contains different types of features studied. Each sub-folder may contain specific code to extract these features from mammographic images.

**## How to Use the Code**

1. Make sure you have Matlab version 2018 installed on your system.

2. Run the scripts in the following order:
   - Execute **Feature Extraction** to extract features from mammographic images and save them in the corresponding folder within "Feature Extraction."
   - Run **Similarity Calculation.m** to calculate the similarity between the query image and images in the database.
   - Execute **RandomForest.m** to classify the obtained distances and obtain the final search results.


**## Dataset Used**

This research utilized the CBIS-DDSM (Curated Breast Imaging Subset of DDSM) database as its primary data source. DDSM is a valuable repository comprising 2,620 scanned film mammography studies, encompassing normal, benign, and malignant cases with verified pathology information. The comprehensive nature of this database, coupled with rigorous ground truth validation, renders DDSM an indispensable tool for the development and testing of decision support systems in mammography.

CBIS-DDSM represents a carefully curated and standardized subset of DDSM data, meticulously selected and processed by trained mammographers. This rigorous curation ensures the quality and consistency of the dataset, providing a robust foundation for our study.

We extend our gratitude to the contributors of CBIS-DDSM and acknowledge the pivotal role this database played in facilitating this research. The dataset can be accessed at the following link: [CBIS-DDSM Dataset](https://wiki.cancerimagingarchive.net/pages/viewpage.action?pageId=22516629).


**## Important Notes**

- Ensure that you have properly configured the parameters and file paths in the scripts before running them.

- The search results heavily depend on the quality of the extracted features and the parameters of the Random Forest algorithm. Feel free to adjust these parameters to achieve the best possible results.

- For any questions or issues, please contact the project author.


