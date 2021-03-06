<a href={https://github.com/Ehyaei/Open-Academic-Graph}><img src="src/img/RWLogo.png" alt="Random Walk in Datasets Logo" align="right" width="160" style="padding: 0 15px; float: right;"/>

# Random Walks in Datasets

Random walks in datasets is a personal effort that aims to investigate data that has a big influence on our everyday lives. The primary goal of this initiative is not only to improve programming abilities. Rather, the main objective is to get a deeper understanding of our surroundings through direct and exploratory data. If you have any suggestions or ideas for the analysis, please let me know.


# Open-Academic-Graph

We looked at scientific publications that make a significant contribution to research and technological progress for this project. This information may be particularly useful to academic scholars because it contains the whole history of all published works. We'll start by giving a quick overview of the data.

Open Academic Graph (OAG) is a large knowledge graph unifying
[Microsoft Academic Graph (MAG)](https://academic.microsoft.com/) and [AMiner](https://aminer.org/).
Two projects' major purpose is to develop a heterogeneous graph comprising scientific publication records and citation linkages between those articles, as well as authors, institutions, journals, conferences, and fields of study. 
After unifying the two datasets, the result can be found [here](https://www.aminer.cn/oag-2-1).

The dataset contains many tables, as:

- authors: includes some information about the authors, such as their names, affiliations, postitions, and a summary of their publications.

- affiliations: contains the name of affiliation, type, and location by latitude and longitude.

- venues: shows information about where work was published.

- papers: this table has many fields and contains publication metadata such as title, publisher, issn, and...

- links: contains id tables for joining each table from MAG to Aminer.

If you have an Azure account, Microsoft has automated uploads of new versions of MAG to Azure Storage.

## Exploration of data

In this project, we can try to find new insights from the academic publication world!