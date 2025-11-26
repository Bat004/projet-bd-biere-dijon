# Description Fonctionnelle

Le projet consiste à créer une base de données pour gérer les bars de Dijon, les bières qu'ils proposent et les prix associés. Cette base permettra de savoir quels bars servent quelles bières, à quel prix, et dans quels quartiers.

Les entités principales sont les bars, les quartiers, les bières et les prix. Chaque bar est un établissement possédant un nom, une adresse et appartenant à un quartier précis. Les quartiers servent à regrouper les bars selon leur localisation géographique. Chaque bière est définie par son nom, son type ou style, son degré d'alcool et sa catégorie (artisanale ou industrielle). Les prix permettent de relier les bars et les bières, en indiquant le prix de vente et la date de mise à jour.

Les relations sont les suivantes : un bar appartient toujours à un quartier, et un quartier peut contenir plusieurs bars. Un bar peut proposer plusieurs bières et une bière peut être proposée dans plusieurs bars, relation gérée par la table des prix.

Les règles métier principales imposent qu'un bar doit toujours être associé à un quartier existant. Une bière peut être disponible dans plusieurs bars, mais le prix peut varier d'un bar à l'autre. Les informations doivent être maintenues à jour afin de refléter les changements de prix ou de disponibilité des bières.

Les attributs importants sont le nom et l'adresse pour les bars, le nom du quartier, le nom, le type, le degré d'alcool et la catégorie pour les bières, ainsi que le prix et la date de mise à jour dans la table des prix. Ces informations permettent de réaliser des analyses comme le prix moyen d'une bière, le nombre de bars par quartier, ou les bières les plus proposées.
