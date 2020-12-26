public with sharing class BoatDataService {

    public static final String LENGTH_TYPE = 'Length'; 
    public static final String PRICE_TYPE = 'Price'; 
    public static final String TYPE_TYPE = 'Type'; 

    public static List<Boat__c> getBoats(String boatTypeId) {
        // Without an explicit boatTypeId, the full list is desired
        String query = 'SELECT '
                     + 'Name, Description__c, Geolocation__Latitude__s, '
                     + 'Geolocation__Longitude__s, Picture__c, Contact__r.Name, '
                     + 'BoatType__c, BoatType__r.Name, Length__c, Price__c '
                     + 'FROM Boat__c';
        if (String.isNotBlank(boatTypeId)) {
            query += ' WHERE BoatType__c = :boatTypeId';
        }
        query += ' WITH SECURITY_ENFORCED ';
        return Database.query(query);
    }

    public static List<Boat__c> getSimilarBoats(Id boatId, String similarBy) {
        List<Boat__c> similarBoats = new List<Boat__c>();
        List<Boat__c> parentBoat = [SELECT Id, Length__c, Price__c, BoatType__c, BoatType__r.Name
                                    FROM Boat__c
                                    WHERE Id = :boatId 
                                    WITH SECURITY_ENFORCED];
        if (parentBoat.isEmpty()) {
            return similarBoats;
        }
        if (similarBy == LENGTH_TYPE) {
            similarBoats = [
                SELECT Id, Contact__r.Name, Name, BoatType__c, BoatType__r.Name, Length__c, Picture__c, Price__c, Year_Built__c
                FROM Boat__c
                WHERE Id != :parentBoat.get(0).Id
                AND (Length__c >= :parentBoat.get(0).Length__c / 1.2)
                AND (Length__c <= :parentBoat.get(0).Length__c * 1.2)
                WITH SECURITY_ENFORCED
                ORDER BY Length__c, Price__c, Year_Built__c
            ];
        } else if (similarBy == PRICE_TYPE) {
            similarBoats = [
                SELECT Id, Contact__r.Name, Name, BoatType__c, BoatType__r.Name, Length__c, Picture__c, Price__c, Year_Built__c
                FROM Boat__c
                WHERE Id != :parentBoat.get(0).Id
                AND (Price__c >= :parentBoat.get(0).Price__c / 1.2)
                AND (Price__c <= :parentBoat.get(0).Price__c * 1.2)
                WITH SECURITY_ENFORCED
                ORDER BY Price__c, Length__c, Year_Built__c
            ];
        } else if (similarBy == TYPE_TYPE) {
            similarBoats = [
                SELECT Id, Contact__r.Name, Name, BoatType__c, BoatType__r.Name, Length__c, Picture__c, Price__c, Year_Built__c
                FROM Boat__c
                WHERE Id != :parentBoat.get(0).Id
                AND (BoatType__c = :parentBoat.get(0).BoatType__c)
                WITH SECURITY_ENFORCED
                ORDER BY Price__c, Length__c, Year_Built__c
            ];
        }
        return similarBoats;
    }

    public static List<BoatType__c> getBoatTypes() {
        return [SELECT Name, Id FROM BoatType__c WITH SECURITY_ENFORCED ORDER BY Name];
    }

    public static List<BoatReview__c> getAllReviews(Id boatId) {
        return [
            SELECT
                Id,
                Name,
                Comment__c,
                Rating__c,
                LastModifiedDate,
                CreatedDate,
                CreatedBy.Name,
                CreatedBy.SmallPhotoUrl,
                CreatedBy.CompanyName
            FROM
                BoatReview__c
            WHERE
                Boat__c =:boatId
            WITH SECURITY_ENFORCED
            ORDER BY
                CreatedDate DESC
        ];
    }

    // Assume this may be an API that return this data, not a SOQL query
    public static String getBoatsByLocation(Decimal latitude, Decimal longitude, String boatTypeId) {
        // Without an explicit boatTypeId, the full list is desired
        String query = 'SELECT Name, Geolocation__Latitude__s, Geolocation__Longitude__s FROM Boat__c ';
        if (String.isNotBlank(boatTypeId)) {
            query += 'WHERE BoatType__c = :boatTypeId ';
        }
        query += ' WITH SECURITY_ENFORCED ORDER BY DISTANCE(Geolocation__c, GEOLOCATION(:latitude, :longitude), \'mi\') LIMIT 10';
        return JSON.serialize(Database.query(query));
    }

    public static String updateBoatList(Object data){
        List<Boat__c> boatsForUpdate = (List<Boat__c>) JSON.deserialize(
            JSON.serialize(data),
            List<Boat__c>.class
        );
        
        update boatsForUpdate;
        return 'Success: Boats updated successfully';
    }
}