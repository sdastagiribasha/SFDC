@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {

    global HTTPResponse respond(HTTPRequest req) {
        
        //system.assertEquals('https://newsapi.org/v2/everything?q=electric%20vehicle&pagesize=10&sortBy=popularity&apiKey=2e0fc5d34db842e4882061335d4b78b4',req.getEndpoint());
        system.assertEquals('callout:newsApi', req.getEndpoint());
        system.assertEquals('GET',req.getMethod());
        
        //create a dummy response
        HTTPResponse res = new HTTPResponse();
        res.setHeader('Content-Type','application/json');
        res.setBody('{"example" : "test"}');
        res.setStatus('Success');
        res.setStatusCode(200);
        return res;
    }
}