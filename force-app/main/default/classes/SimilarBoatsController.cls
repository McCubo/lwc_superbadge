public class SimilarBoatsController {

    public Double mainBoatPrice { get; set; }
    public Integer mainBoatLength { get; set; }
    public Integer mainBoatYear { get; set; }
    public Id mainBoatId { get; set; }

    //visualforce page attribute
    public Boat__c boat { get; private set; }
    //visualforce page controller
    public SimilarBoatsController() {
        Id boatId = ApexPages.currentPage().getParameters().get('id');
        System.debug('boatId: ' + boatId);
        boat = (boatId == null) ? new Boat__c() : 
        [SELECT Id, Name, BoatType__c, Length__c, Picture__c, Price__c, Year_Built__c FROM Boat__c WHERE Id = :boatId];
    }

    public SimilarBoatsController(Id mainBoatId, Integer mainBoatLength, Double mainBoatPrice, Integer mainBoatYear) {
        this.mainBoatLength = mainBoatLength;
        this.mainBoatPrice = mainBoatPrice;
        this.mainBoatYear = mainBoatYear;
        this.mainBoatId = mainBoatId;
    }

    public List<Boat__c> getSimilarBoats() {
        List<Boat__c> similarBoatsList = [
            SELECT  Id, Name, BoatType__r.Name, Length__c, Picture__c, Price__c, Year_Built__c
            FROM   Boat__c
            WHERE  Id != :this.mainBoatId
            AND   (Length__c >= :this.mainBoatLength / 1.2)
            AND   (Length__c <= :this.mainBoatLength * 1.2)
            ORDER BY Length__c, Price__c, Year_Built__c
        ];
        return similarBoatsList;
    }

}