# Evolutionary learning of weighted linear composite dispatching rules for scheduling

A prevalent approach to solving job shop scheduling problems is to combine several relatively simple dispatching rules such that they may benefit each other for a given problem space. Generally, this is done on an ad-hoc basis, requiring expert knowledge from heuristics designer, or extensive exploration of suitable combinations of heuristics. The approach here, is to automate that selection, by translating dispatching rules into measurable features and optimising what their contribution should be via evolutionary search. The framework is straight forward and easy to implement and shows promising results. Various data distributions are investigated, for both job shop and flow shop problems, as is scalability for higher dimensions. 

Moreover, the study shows that the choice of objective function  for evolutionary search is worth investigating. Since the optimisation is based on minimising the expected mean of the fitness function over a large set of problem instances, which can vary within. Then normalising the objective function can stabilise the optimisation process away from local minima. 

## Citation
```
@inproceedings{InRu14,
  author    = {Helga Ingimundardottir and Thomas Philip Runarsson},
  title     = {Evolutionary Learning of Weighted Linear Composite Dispatching Rules for Scheduling},
  booktitle = {{ECTA} 2014 - Proceedings of the International Conference on Evolutionary
               Computation Theory and Applications, part of {IJCCI} 2014, Rome, Italy, 22-24 October, 2014},
  pages     = {59--67},
  year      = {2014},
  crossref  = {DBLP:conf/ijcci/2014ecta},
  url       = {http://dx.doi.org/10.5220/0005077200590067},
  doi       = {10.5220/0005077200590067},
  timestamp = {Wed, 03 Jun 2015 07:37:16 +0200},
  biburl    = {http://dblp.uni-trier.de/rec/bib/conf/ijcci/Ingimundardottir14},
  bibsource = {dblp computer science bibliography, http://dblp.org}
}
```
