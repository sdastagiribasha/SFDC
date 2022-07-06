public class APICallingwithThirdparty {
    
    public static String GetFBDetails(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://api.currencylayer.com/live?access_key=8fabf053a72bce2914a446fbda149bf4');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            return response.getBody();
        }
        return '';
    }
        
        
        //string url = 'http://apilayer.net/api/live?access_key=02f8dbb6fd66efeedb1936ba6d308b46';
        //string acckey = Label.CurrencyLayerApiKey;
        public static string dispdata { get; set; }
        public static string contentType;
        public static integer status;
        static string responsebody;
        
    	
        public static void getlivedata(){
            list<APICallingwithThirdparty> lis =  new list<APICallingwithThirdparty>();
            http ht = new http();
            HttpRequest re = new HttpRequest();
            //re.setHeader('Authorization','Bearer '+ acckey);
            re.setHeader('Content-Type', 'application/json');
            re.setHeader('accept', 'application/json');
            string endpoint = 'http://apilayer.net/api/live?access_key=8fabf053a72bce2914a446fbda149bf4&currencies=EUR,GBP,CAD,INR&source=USD&format=1';
            re.setEndpoint(endpoint);
            re.setMethod('GET');
            httpResponse resp = ht.send(re);
            system.debug('The response is'+resp);
            responsebody = resp.getBody();
            contentType = resp.getHeader('Content-Type');
            status = resp.getStatusCode();
            dispdata = responsebody;
            system.debug('Content' +responsebody);
            //resp1 = resp;
           
            
            HttpResponse hresp1 = ht.send(re);
            APICallingwithThirdparty wResp1 = (APICallingwithThirdparty) JSON.deserialize(hresp1.getBody(), APICallingwithThirdparty.class);
            lis.add(wResp1);
            system.debug('after deserialize:' + lis);
        }
    }