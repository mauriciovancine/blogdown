---
title: Introduction to the use of geospatial data in R
summary: Learn the main theoretical and practical concepts of the use of geospatial data with R applied to Ecology
date: 2021-10-25
lastmod: 2021-10-19
linktitle:
menu:
  example:
    name: 
    weight: 1
toc: true
type: docs
weight: 
---

## Description

### Graduate Program in Ecology, Evolution and Biodiversity

**Responsible teacher** <br>
Prof. Milton Cezar Ribeiro

**Invited teacher** <br>
Prof. Maurício Humberto Vancine

**Period** <br>
25/10/2021 - 05/11/2021

**Credits** <br>
60 hours (4 credits)

**Students** <br>
10 + 5 specials

**Resume** <br>

The course will offer the main theoretical and practical concepts regarding the functioning of the R language and its use for manipulation and visualization of tabular and geospatial data, with a focus on General Ecology. The following topics will be addressed: (1) version control, git and GitHub, (2) operation of the R language, (3) structure and data manipulation in R, (4) introduction to tidyverse, (5) data visualization in R, (6) structure and source of geospatial data, (7) structure and manipulation of vector data in R, (8) structure and manipulation of matrix data in R, and (9) visualization of geospatial data in R. The total workload it will be 60 hours, where in the five initial days 6 hours of theoretical-practical classes will be taught, in a total of 30 hours. The remaining 30 hours will be directed to the formulation and execution of a project with real data, as a form of evaluation to compose the final grade of the course. After completing the course, students are expected to acquire general concepts about the structure, manipulation and visualization of tabular and geospatial data, as well as mastery of techniques and methods to achieve autonomy and produce solutions to their own issues related to geocomputing using the R language.

---

### Information to participants

**Dates and times** <br>
Theoretical-practical: 25/10/2021-29/10/2021 <br>
Remotely assisted exercises-activities: 01/11/2021-05/11/2021

**Teaching plan** <br>
[pdf](https://github.com/mauriciovancine/course-geospatial-data-r/blob/master/00_plano_ensino/plano_ensino_analise_geoespacial_r.pdf)

**Contact** <br>
For more information or questions, send an email to Maurício Vancine (mauricio.vancine@gmail.com)

---

### Instructions to participants

**Hardware** <br>
Everyone will need to use their notebooks

**Softwares** <br>
R, RStudio and git <br>

1. Install the latest version of [R (4.1.1)](https://www.r-project.org) e [RStudio (2021.09.0-351)](https://www.rstudio.com)
- [R and RStudio installation video](https://youtu.be/l1bWvZMNMCM) <br>
- [R language course](https://www.youtube.com/playlist?list=PLucm8g_ezqNq0RMHvzZ8M32xhopFhmsr6)

2. Install [git (2.30)](https://git-scm.com/downloads)
- [git installation video](https://youtu.be/QSfHNEiBd2k) <br>

**Online accounts** <br>
Create a GitHub account and keep these three pieces of information:
- user
- email
- password

#### Linux (Ubuntu and Linux Mint)

```
# r
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
gpg --keyserver keyserver.ubuntu.com --recv-key E298A3A825C0D65DFD57CBB651716619E084DAB9
gpg -a --export E298A3A825C0D65DFD57CBB651716619E084DAB9 | sudo apt-key add -
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/"
sudo apt update
sudo apt install -y r-base r-base-core r-recommended r-base-dev

# r spatial
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt update
sudo apt install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev

# rstudio
wget -c https://download1.rstudio.org/desktop/bionic/amd64/rstudio-2021.09.0%2B351-amd64.deb &&
sudo dpkg -i rstudio-2021.09.0+351-amd64.deb &&
sudo apt install -fy && 
rm rstudio-2021.09.0+351-amd64.deb

# git
sudo add-apt-repository ppa:git-core/ppa 
sudo apt update
sudo apt install -y git
```

**Install  R packages** <br>
With R and RStudio installed, download this [script](https://github.com/mauriciovancine/course-geospatial-data-r/blob/master/02_scripts/00_script_intro_geoespacial_r.R) (scripts are scripts that have commands, as a draft)

Open the script (**00_script_intro_geoespacial_r.R**) in RStudio software and run each command line to install the packages, you must be connected to the internet

To run the lines of code, just place the cursor on the line of code and press: `Ctrl + Enter`

---

## Material

### Site
- [link](https://mauriciovancine.github.io/course-geospatial-data-r/)

### Slides

[0. Introductions](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/00_slides_intro_geoespacial_r.html#1) <br>
[1. Version control, Git and GitHub](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/01_slides_intro_geoespacial_r.html#1) <br>
[2. R language](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/02_slides_intro_geoespacial_r.html#1) <br>
[3. Data structure and manipulation](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/03_slides_intro_geoespacial_r.html#1l) <br>
[4. Introduction to tidyverse](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/04_slides_intro_geoespacial_r.html#1) <br>
[5. Data visualization](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/05_slides_intro_geoespacial_r.html) <br>
[6. Geospatial data source and structure](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/06_slides_intro_geoespacial_r.html) <br>
[7. Structure and manipulation of vector data](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/07_slides_intro_geoespacial_r.html) <br>
[8. Structure and manipulation of raster data](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/08_slides_intro_geoespacial_r.html) <br>
[9. Geospatial data visualization](https://mauriciovancine.github.io/course-geospatial-data-r/01_slides/09_slides_intro_geoespacial_r.html)

### Scripts

[1. Install packages](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/03_script_intro_geoespacial_r.R) <br>
[3. Data structure and manipulation](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/03_script_intro_geoespacial_r.R) <br>
[4. Introduction to tidyverse](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/04_script_intro_geoespacial_r.R) <br>
[5. Data visualization](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/05_script_intro_geoespacial_r.R) <br>
[7. Structure and manipulation of vector data](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/07_script_intro_geoespacial_r.R) <br>
[8. Structure and manipulation of raster data](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/08_script_intro_geoespacial_r.R) <br>
[9. Geospatial data visualization](https://mauriciovancine.github.io/course-geospatial-data-r/blob/master/02_scripts/09_script_intro_geoespacial_r.R)

---