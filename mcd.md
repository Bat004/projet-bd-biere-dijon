# Modèle Conceptuel de Données (MCD)

Le MCD représente les entités, leurs attributs, les relations entre elles avec les cardinalités et les verbes associés. Il est basé sur le projet « Carte des bars à Dijon + prix des bières ».

## 1. Entités et Attributs

**Quartier**
- Identifiant du quartier
- Nom du quartier

**Bar**
- Identifiant du bar
- Nom du bar
- Adresse du bar
- Référence au quartier auquel il appartient

**Bière**
- Identifiant de la bière
- Nom de la bière
- Type ou style (lager, ale, stout…)
- Degré d'alcool
- Catégorie (artisanale, industrielle…)

**Prix**
- Identifiant du prix
- Référence au bar
- Référence à la bière
- Prix de la bière dans le bar
- Date de mise à jour du prix

---

## 2. Relations, Cardinalités et Verbes

1. **Bar ↔ Quartier**
- Verbe : "Appartient à"
- Cardinalité : Un bar appartient à un quartier, un quartier peut contenir plusieurs bars (1,N)

2. **Bar ↔ Bière via Prix**
- Verbe : "Propose"
- Cardinalité : Un bar peut proposer plusieurs bières, et une bière peut être proposée dans plusieurs bars (N,N)
- La relation N-N est gérée par la table **Prix**, qui contient le prix et la date de mise à jour.

---

## 3. Diagramme MCD (Mermaid)

```mermaid
erDiagram
    QUARTIER {
        int id_quartier PK
        string nom_quartier
    }

    BAR {
        int id_bar PK
        string nom
        string adresse
        int id_quartier FK
    }

    BIERE {
        int id_biere PK
        string nom_biere
        string type_biere
        float degres_alcool
        string categorie
    }

    PRIX {
        int id_prix PK
        int id_bar FK
        int id_biere FK
        float prix
        date date_mise_a_jour
    }

    QUARTIER ||--o{ BAR : "possède / appartient à"
    BAR ||--o{ PRIX : "propose"
    BIERE ||--o{ PRIX : "est proposé par"
