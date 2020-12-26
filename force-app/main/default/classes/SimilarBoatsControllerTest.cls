@isTest
public with sharing class SimilarBoatsControllerTest {
    @testSetup
    static void createData(){
        Test.startTest();
        GenerateData.init();
        Test.stopTest();
    }
    
    @isTest
    static void testGetSimilarBoatsByLength(){
        List<Boat__c> boat = [SELECT Id, Length__c, Price__c,Year_Built__c  FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');

        SimilarBoatsController controller = new SimilarBoatsController(boat.get(0).Id, (Integer)boat.get(0).Length__c,(Double)boat.get(0).Price__c, (Integer)boat.get(0).Year_Built__c);
        List<Boat__c> boatsByLength =  controller.getSimilarBoats();
        List<Boat__c> boatsByLengthExpected = [ 
                SELECT Id,Length__c
                FROM Boat__c
                WHERE Id != :boat.get(0).Id
                AND (Length__c >= :boat.get(0).Length__c / 1.2)
                AND (Length__c <= :boat.get(0).Length__c * 1.2)
            ];
        System.assertEquals(boatsByLengthExpected.size(), boatsByLength.size(), 'The query did not return the expected similar boats by length.');
    }

    @isTest
    static void testVisualForcePageController(){
        List<Boat__c> boat = [SELECT Id, Length__c, Price__c,Year_Built__c  FROM Boat__c limit 1];
        System.assertEquals(1, boat.size(), 'There are no boats inserted.');

        PageReference pageRef = Page.SimilarBoats;
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('id', boat.get(0).Id);

        SimilarBoatsController controller = new SimilarBoatsController();

    }

}