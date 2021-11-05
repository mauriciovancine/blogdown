---
title: Fonte de dados geoespaciais
author: mauriciovancine
date: "2021-03-17"
slug: []
categories: [spatial,rspatial]
tags: [spatial,rspatial]
subtitle: ""
summary: "Uma listagem de fonte de dados geoespaciais"
authors: []
lastmod: r`Sys.time()`
featured: no
image:
  caption: "[Imagem de Andrew Neel](https://unsplash.com/photos/1-29wyvvLJA)"
  focal_point: "center"
  preview_only: no
projects: []
---



## Contextualização

Existe diversas fontes de dados geográficos em diferentes bases de dados disponíveis gratuitamente. Geralmente essas bases de dados são disponibilizadas separadamente em apenas dados vetoriais e dados raster. Para **dados vetoriais**, grande parte dos dados disponibilizados são utilizados em mapas como limites políticos, limites de biomas ou distribuição de espécies para **polígonos**; estradas e rios para **dados lineares**, ou ainda pontos de ocorrência de espécies ou comunidades, ou medidas tomadas em campo sobre condições naturais como clima ou relevo, como **pontos**. 

Entretanto, é sempre recomendado o uso de **bases oficiais**, principalmente em relação a dados vetoriais de **limites políticos**. Para tanto, é fundamental buscar as **bases oficiais de cada país**, entrentanto, há bases que podem ser utilizadas globalmente. Sobre as **bases de dados raster**, há uma infinidade de dados para diferentes objetivos, mas grande parte deles são relativos a condições ambientais, representando uma variável de interesse de forma contínua no espaço, como temperatura, precipitação, elevação, etc.

Há uma compilação de dados geográficos vetoriais e raster feita por Marcus Vinícius Alves de Carvalho e Angelica Carvalho Di Maio, chamada [GeoLISTA](http://www.clickgeo.com.br/wp-content/uploads/2018/05/GeoLISTA.pdf). Entretanto, como as bases de dados tendem a ser muito dinâmicas, é possível que muitas bases tenham surgido e desaparecido desde a listagem realizada.

Atualmente encontrei outra compilação fantástica: [Free GIS Data](http://freegisdata.rtwilson.com/#home).

Além das bases de dados, há pacotes específicos no R que fazem o download de dados vetoriais e rasters facilitando a aquisição e reprodutibilidade. Para conferir uma listagem completa de pacotes para diversas análises espaciais, veja [CRAN Task View: Analysis of Spatial Data](https://cran.r-project.org/web/views/Spatial.html).

### Vetor

Dentre as bases vetoriais, destaco as seguintes na Tabela <a href="#tab:tab-vetor-bases">1</a>:


Table: Table 1: Principais bases de dados vetoriais para o Brasil e o mundo.

|Bases de dados                                                                                     |Descrição                                                                                                     |
|:--------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------|
|[IBGE](https://www.ibge.gov.br/geociencias/downloads-geociencias.html)                             |Limites territoriais e censitários do Brasil                                                                  |
|[IBGE Cidades](https://cidades.ibge.gov.br/)                                                       |Informações do IBGE sobre os municípios e estados do Brasil                                                   |
|[Sistema Nacional de Informações sobre Recursos Hídricos (SNIRH)](https://www.snirh.gov.br/)       |Base para disponibilização das informações sobre águas no Brasil                                              |
|[Sistema IBGE de Recuperação Automática (SIDRA)](https://sidra.ibge.gov.br/)                       |Indicadores econômicos, financeiros, sociais e políticos do Brasil                                            |
|[FBDS](http://geo.fbds.org.br/)                                                                    |Uso da terra, APP e hidrografia - Mata Atlântica e Cerrado                                                    |
|[Atlas da Mata Atlântica](http://mapas.sosma.org.br/dados/)                                        |Mapeamento de floresta para o Bioma da Mata Atlântica                                                         |
|[GeoBank](http://geosgb.cprm.gov.br/)                                                              |Dados geológicos do Brasil                                                                                    |
|[Pastagem.org](http://maps.lapig.iesa.ufg.br)                                                      |Dados de pastagens e gado para o Brasil                                                                       |
|[CanaSat](http://www.dsr.inpe.br/laf/canasat/)                                                     |Dados de cana-de-açúcar para o Brasil                                                                         |
|[CSR Maps](http://maps.csr.ufmg.br)                                                                |Diversos dados vetoriais e raster para o Brasil                                                               |
|[Dados Abertos da Agência Nacional de Águas e Saneamento Básico](https://dadosabertos.ana.gov.br/) |Dados de águas e saneamento básico para o Brasil                                                              |
|[HIDROWEB](https://www.snirh.gov.br/hidroweb/serieshistoricas)                                     |Dados de estações pluviométricas e fluviométricas para o Brasil                                               |
|[Ecoregions](https://ecoregions2017.appspot.com/)                                                  |Dados de biorregiões e biomas do mundo                                                                        |
|[UN Biodiversity Lab](https://www.unbiodiversitylab.org/)                                          |Diversas bases de dados para o mundo                                                                          |
|[Biodiversity Hotspots](https://zenodo.org/record/3261807#.YA8lpPv0nOY)                            |Dados dos limites dos Hotspots de Biodiversidade                                                              |
|[IUCN Red List of Threatened Species](https://www.iucnredlist.org/resources/spatial-data-download) |Dados dos limites das distribuições das espécies para o mundo                                                 |
|[Map of Life (MOL)](https://mol.org/)                                                              |Dados da distribuição de espécies e outros dados para o mundo                                                 |
|[Key Biodiversity Areas](http://www.keybiodiversityareas.org/kba-data/request)                     |Dados dos limites das Key Biodiversity Areas                                                                  |
|[Marineregions.org](http://marineregions.org/)                                                     |Informações de limites marinhos do mundo                                                                      |
|[HydroSHEDS](https://www.hydrosheds.org/)                                                          |Informações hidrológicas do mundo                                                                             |
|[Water Information Network System](http://ihp-wins.unesco.org/)                                    |Informações hidrológicas do mundo                                                                             |
|[Freshwater Information Platform](http://project.freshwaterbiodiversity.eu/)                       |Informações hidrológicas do mundo                                                                             |
|[Global Roads Inventory Project (GRIP)](https://www.globio.info/download-grip-dataset)             |Dados de estradas do mundo todo                                                                               |
|[Database of Global Administrative Areas (GADM)](https://gadm.org/)                                |Limites de áreas administrativas do mundo                                                                     |
|[Natural Earth](https://www.naturaleatoriorthdata.com/)                                            |Diversos limites para o mundo                                                                                 |
|[Socioeconomic Data and Applications Center (sedac)](https://sedac.ciesin.columbia.edu/)           |Dados socio-econômicos para o mundo                                                                           |
|[WorldPop](https://www.worldpop.org/)                                                              |Dados sobre distribuição, demogradia e dinâmica da população no mundo                                         |
|[Protected Planet](https://www.protectedplanet.net)                                                |Limites de áreas protegidas para o mundo                                                                      |
|[Global Biological Information Facility (GBIF)](http://www.gbif.org)                               |Dados de ocorrências de espécies para o mundo                                                                 |
|[Species Link](http://www.splink.cria.org.br)                                                      |Dados de ocorrências de espécies para o Brasil                                                                |
|[Global Invasive Species Information Network (GISIN)](http://www.gisin.org)                        |Dados de ocorrências de espécies invasoras para o mundo                                                       |
|[International Institute for Applied Systems Analysis (IIASA)](https://iiasa.ac.at/)               |Dados de mudanças climáticas, segurança energética, envelhecimento da população e desenvolvimento sustentável |

### Raster

Dentre as bases raster, destaco as seguintes na Tabela <a href="#tab:tab-raster-bases">2</a>:


Table: Table 2: Principais bases de dados raster para o Brasil e o mundo.

|Bases de dados                                                                                                                   |Descrição                                                                                                                          |
|:--------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------|
|[MapBiomas](https://mapbiomas.org/)                                                                                              |Uso e cobertura da terra para o Brasil, Panamazonia Legal e Chaco, de 1985 a 2019 do Brasil                                        |
|[Monitoramento da Cobertura e Uso da Terra do Brasil - IBGE](https://www.ibge.gov.br/apps/monitoramento_cobertura_uso_terra/v1/) |Mapeamento periódico da cobertura e uso da terra, de 2000 a 2018 do Brasil                                                         |
|[Bahlu](ftp://madeira.dea.ufv.br/bdados/bhalu/)                                                                                  |Distribuições históricas de terras agrícolas e pastagens para todo o Brasil de 1940 a 2012                                         |
|[Dados meteorológicos do Brasil](https://sites.google.com/site/alexandrecandidoxavierufes/dados-meteorologicos-do-brasil)        |Dados meteorológicos do Brasil                                                                                                     |
|[USGS](https://www.usgs.gov/)                                                                                                    |Dados de diversos satélites livres para o mundo                                                                                    |
|[SRTM](http://srtm.csi.cgiar.org/)                                                                                               |Dados de elevação para o mundo                                                                                                     |
|[ETOPO1](https://www.ngdc.noaa.gov/mgg/global/)                                                                                  |Dados de elevação para o mundo                                                                                                     |
|[OpenTopography](https://opentopography.org/)                                                                                    |Dados de elevação para o mundo                                                                                                     |
|[MERIT DEM: Multi-Error-Removed Improved-Terrain DEM](http://hydro.iis.u-tokyo.ac.jp/~yamadai/MERIT_DEM/index.html)              |Dados de elevação de diversas fontes                                                                                               |
|[Geoservice Maps](https://geoservice.dlr.de/web/maps)                                                                            |Dados de elevação e florestas para o mundo                                                                                         |
|[Global Forest Watch](https://www.globalforestwatch.org/)                                                                        |Dados de florestas para o mundo                                                                                                    |
|[Global Forest Change](https://earthenginepartners.appspot.com/science-2013-global-forest/download_v1.7.html)                    |Resultados da análise de série temporal de imagens Landsat na caracterização da extensão e mudança florestal global de 2000 a 2019 |
|[GlobCover](http://due.esrin.esa.int/page_globcover.php)                                                                         |Dados de uso e cobertura da terra para todo o planeta                                                                              |
|[Global land cover and land use 2019](https://glad.umd.edu/dataset/global-land-cover-land-use-v1)                                |Dados de uso e cobertura da terra para todo o planeta                                                                              |
|[WorldCover](https://esa-worldcover.org/en)                                                                                      |Dados de uso e cobertura da terra para todo o planeta                                                                              |
|[Landcover](https://www.earthenv.org/landcover)                                                                                  |Dados de uso e cobertura da terra para todo o planeta                                                                              |
|[Global Land Analysis & Discovery](https://glad.umd.edu/)                                                                        |Dados de uso e cobertura da terra para todo o planeta                                                                              |
|[Global Human Footprint](https://wcshumanfootprint.org/)                                                                         |Dados de pegada ecológica para o mundo                                                                                             |
|[Machine-learning Global Human Footprint](https://mountainscholar.org/handle/10217/216207)                                       |Dados de pegada ecológica para o mundo com machine-learning                                                                        |
|[GHSL - Global Human Settlement Layer](https://ghsl.jrc.ec.europa.eu/download.php)                                               |Dados e ferramentas abertos e gratuitos para avaliar a presença humana no planeta                                                  |
|[The Humanitarian Data Exchange](https://data.humdata.org/)                                                                      |Dados humanitários para o mundo                                                                                                    |
|[Land-Use Harmonization (LUH2)](https://luh.umd.edu/)                                                                            |Dados atuais e previsões de uso da terra                                                                                           |
|[Global Biosphere Management Model (GLOBIOM)](https://iiasa.ac.at/web/home/research/GLOBIOM/GLOBIOM.html)                        |Dados atuais e previsões de uso da terra                                                                                           |
|[ESA Climate Change Initiative](https://climate.esa.int/en/odp/#/dashboard)                                                      |Arquivos globais de observação da Terra nos últimos 30 anos da Agência Espacial Europeia (ESA)                                     |
|[WorldClim](https://www.worldclim.org/)                                                                                          |Dados climáticos para o mundo                                                                                                      |
|[CHELSA](https://chelsa-climate.org/)                                                                                            |Dados climáticos para o mundo                                                                                                      |
|[ecoClimate](https://www.ecoclimate.org/)                                                                                        |Dados climáticos para o mundo                                                                                                      |
|[Vincent Deblauwe climate data](https://vdeblauwe.wordpress.com/download/)                                                       |Dados climáticos derivados de sensoriamento remoto para o mundo                                                                    |
|[PaleoClim.org](http://www.paleoclim.org/)                                                                                       |Dados climáticos do passado para o mundo                                                                                           |
|[EarthEnv](https://www.earthenv.org/)                                                                                            |Dados de cobertura da terra, nuvens, relevo e hidrografia                                                                          |
|[CGIAR-CSI - Consortium for Spatial Information](https://cgiarcsi.community/category/data/)                                      |Diversos dados geoespaciais para o mundo                                                                                           |
|[SoilGrids](https://soilgrids.org/)                                                                                              |Dados de solo para o mundo                                                                                                         |
|[MERIT Hydro: global hydrography datasets](http://hydro.iis.u-tokyo.ac.jp/~yamadai/MERIT_Hydro/)                                 |Dados de hidrologia do mundo                                                                                                       |
|[OSM Water Layer: Surface Waters in OpenStreetMap](http://hydro.iis.u-tokyo.ac.jp/~yamadai/OSM_water/index.html)                 |Dados de hidrologia do mundo                                                                                                       |
|[Global 3-second/1-second Water Body Map](http://hydro.iis.u-tokyo.ac.jp/~yamadai/G3WBM/index.html)                              |Dados de hidrologia do mundo                                                                                                       |
|[GWD-LR: Global Width Database of Large Rivers](http://hydro.iis.u-tokyo.ac.jp/~yamadai/GWD-LR/index.html)                       |Dados de hidrologia do mundo                                                                                                       |
|[CaMa-Flood: Global River Hydrodynamics Model](http://hydro.iis.u-tokyo.ac.jp/~yamadai/cama-flood/index.html)                    |Dados de hidrologia do mundo                                                                                                       |
|[HydroSHEDS](https://www.hydrosheds.org/)                                                                                        |Dados de hidrologia do mundo                                                                                                       |
|[Global Wetlands](https://www2.cifor.org/global-wetlands/)                                                                       |Dados de áreas úmidas para o mundo                                                                                                 |
|[Global Surface Water Explorer](https://global-surface-water.appspot.com/#)                                                      |Dados de águas superficiais para o mundo                                                                                           |
|[MARSPEC](http://www.marspec.org/)                                                                                               |Dados de condições do oceano para o mundo                                                                                          |
|[Bio-ORACLE](http://www.oracle.ugent.be/)                                                                                        |Dados de condições do oceano para o mundo                                                                                          |
|[MyOcean](https://marine.copernicus.eu/access-data/myocean-viewer)                                                               |Dados de condições do oceano para o mundo                                                                                          |

### Pacotes do R

Dentre os pacotes no R para download de dados geográficos, destaco os seguintes na Tabela <a href="#tab:tab-packages-bases">3</a>:


Table: Table 3: Principais pacotes no R para download de dados vetoriais e raster.

|Pacotes                                                                           |Descrição                                                                            |
|:---------------------------------------------------------------------------------|:------------------------------------------------------------------------------------|
|[geobr](https://cran.r-project.org/web/packages/geobr/index.html)                 |Carrega Shapefiles de Conjuntos de Dados Espaciais Oficiais do Brasil                |
|[sidrar](https://cran.r-project.org/web/packages/sidrar/index.html)               |Accessa os dados do SIDRA - Sistema IBGE de Recuperação Automática                   |
|[rnaturalearth](https://cran.r-project.org/web/packages/rnaturalearth/index.html) |Dados do mapa mundial da Natural Earth                                               |
|[rworldmap](https://cran.r-project.org/web/packages/rworldmap/index.html)         |Mapeando Dados Globais                                                               |
|[spData](https://cran.r-project.org/web/packages/spData/index.html)               |Conjuntos de dados para análise espacial                                             |
|[OpenStreetMap](https://cran.r-project.org/web/packages/OpenStreetMap/index.html) |Acesso para abrir imagens raster de mapas de ruas                                    |
|[osmdata](https://cran.r-project.org/web/packages/osmdata/index.html)             |Baixe e importe dados do OpenStreetMap                                               |
|[geonames](https://cran.r-project.org/web/packages/geonames/index.html)           |Interface para o serviço da Web de consulta espacial 'Geonames'                      |
|[rgbif](https://cran.r-project.org/web/packages/rgbif/index.html)                 |Interface para o Global 'Biodiversity' Information Facility API                      |
|[maptools](https://cran.r-project.org/web/packages/maptools/index.html)           |Ferramentas para lidar com objetos espaciais                                         |
|[marmap](https://cran.r-project.org/web/packages/marmap/index.html)               |Importar, traçar e analisar dados batimétricos e topográficos                        |
|[oce](https://cran.r-project.org/web/packages/oce/index.html)                     |Fonte e processamento de dados oceanográficos                                        |
|[envirem](https://cran.r-project.org/web/packages/envirem/index.html)             |Geração de Variáveis ENVIREM                                                         |
|[sdmpredictors](https://cran.r-project.org/web/packages/sdmpredictors/index.html) |Conjuntos de dados preditor de modelagem de distribuição de espécies                 |
|[metScanR](https://cran.r-project.org/web/packages/metScanR/index.html)           |Encontre, Mapeie e Colete Dados e Metadados Ambientais                               |
|[ClimDown](https://cran.r-project.org/web/packages/ClimDown/index.html)           |Biblioteca de redução de escala do clima para a produção diária do modelo climático  |
|[rWBclimate](https://cran.r-project.org/web/packages/rWBclimate/index.html)       |Acessa dados climáticos do Banco Mundial                                             |
|[rnoaa](https://cran.r-project.org/web/packages/rnoaa/index.html)                 |Dados meteorológicos 'NOAA' de R                                                     |
|[RNCEP](https://cran.r-project.org/web/packages/RNCEP/index.html)                 |Obtenha, organize e visualize dados meteorológicos NCEP                              |
|[smapr](https://cran.r-project.org/web/packages/smapr/index.html)                 |Aquisição e processamento de dados ativos-passivos (SMAP) de umidade do solo da NASA |
