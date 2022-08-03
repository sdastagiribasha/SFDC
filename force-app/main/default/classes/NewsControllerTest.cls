@isTest
private with sharing class NewsControllerTest {
    
    @TestSetup
    static void makeData() {
        
    }
    
    @isTest
    static void testGetPositiveCallout() {
       Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
       Test.startTest();
       NewsController.retriveNews();
       Test.stopTest();
    }
    
    @isTest
    static void testGetNegative() {
        
		RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();  
        
        req.requestURI = 'https://newsapi.org/v2/everything?q=electric vehicle&pagesize=10&sortBy=popularity&apiKey=2e0fc5d34db842e4882061335d4b78b4';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response= res;
        
        Test.startTest();
        NewsController.retriveNews();
        Test.stopTest();               
    }
 
}