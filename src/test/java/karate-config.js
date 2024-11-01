function fn() {

// mvn test -DargLine="-Dkarate.env=local" For Local environment
// mvn test -DargLine="-Dkarate.env=dev" For dev environment
    var env = karate.env; // get system property 'karate.env'
    karate.log('================================================================');
    karate.log('================================================================');
    karate.log('karate.env system property was:', env);
    karate.configure('readTimeout', 999999);
    if (!env) {

        env = 'reck';

    }


    var config = {
        env: env,
        tokenfe:"",
        myVarName: 'hello karate',
        baseUrl_Rating : 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime',
        baseUrlVerify : 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime',
        urlScoringApi : "https://scoring-search-dev.ivs-hp.be-ys.com/scoring-search/searchRules/V2/",
        urlBCUMAN : "https://rating-backend-dev.ivs-hp.be-ys.com/regulation/all",
        urlNDM : "https://rating-backend-dev.ivs-hp.be-ys.com/api/revaluation-Indices",
        token : "classpath:common/Authorization.feature@access_token"

    }
    if (env ==='dev') {
            config.baseUrl = 'https://rating-backend-dev.ivs-hp.be-ys.com/pivot/realtime'
            config.baseUrlVerify = 'https://rating-backend-dev.ivs-hp.be-ys.com/verify',
            config.urlSearch ='https://rating-backend-dev.ivs-hp.be-ys.com/usages/search/v1',
            config.baseUrlDecesShares = 'https://rating-backend-dev.ivs-hp.be-ys.com/sharesCalculation',
            config.baseUrlDecesParts = 'https://rating-backend-dev.ivs-hp.be-ys.com/partsCalculation',
            config.urlDecesSharesV2 = 'https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation',
            config.urlGetIndemnisation = 'https://rating-backend-dev.ivs-hp.be-ys.com/V2/sharesCalculation/search',
            config.urlDeleteParts = 'https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation/delete',
            config.simulateUrl = 'https://rating-backend-dev.ivs-hp.be-ys.com/rating/simulate',
            config.urlcancel = 'https://rating-backend-dev.ivs-hp.be-ys.com/usages/cancel',
            config.urlCounter ='https://rating-backend-dev.ivs-hp.be-ys.com/counter/search',
            config.urlLimit = 'https://rating-backend-dev.ivs-hp.be-ys.com/limits/search',
            config.urlExternal = 'https://rating-backend-dev.ivs-hp.be-ys.com/usages/external',
            config.token = "classpath:common/Authorization.feature@access_token",
            config.terminologieUrl ="https://rating-backend-dev.ivs-hp.be-ys.com/terminologies/search",
            config.UrlAnnulation ="https://rating-backend-dev.ivs-hp.be-ys.com/usages/cancel",
            config.urlScoringApi = "https://scoring-search-dev.ivs-hp.be-ys.com/scoring-search/searchRules/V2/",
            config.urlpartsCalculation =  "https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation",
            config.urlSharesCalculation =  "https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation",
            config.urlBCUMAN =  "https://rating-backend-dev.ivs-hp.be-ys.com/regulation/all",
            config.urlNDM =  "https://rating-backend-dev.ivs-hp.be-ys.com/api/revaluation-Indices"
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
        // customize
        // e.g. config.foo = 'bar';

    } else if (env === 'devk') {
            config.baseUrl = 'https://rating-backend-dev.ivs-hp.be-ys.com/pivot/realtime'
            config.baseUrlVerify = 'https://rating-backend-dev.ivs-hp.be-ys.com/verify',
            config.urlSearch ='https://rating-backend-dev.ivs-hp.be-ys.com/usages/search/v1',
            config.baseUrlDecesShares = 'https://rating-backend-dev.ivs-hp.be-ys.com/sharesCalculation',
            config.baseUrlDecesParts = 'https://rating-backend-dev.ivs-hp.be-ys.com/partsCalculation',
            config.urlDecesSharesV2 = 'https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation',
            config.urlGetIndemnisation = 'https://rating-backend-dev.ivs-hp.be-ys.com/V2/sharesCalculation/search',
            config.urlDeleteParts = 'https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation/delete',
            config.simulateUrl = 'https://rating-backend-dev.ivs-hp.be-ys.com/rating/simulate',
            config.urlcancel = 'https://rating-backend-dev.ivs-hp.be-ys.com/usages/cancel',
            config.urlCounter ='https://rating-backend-dev.ivs-hp.be-ys.com/counter/search',
            config.urlLimit = 'https://rating-backend-dev.ivs-hp.be-ys.com/limits/search',
            config.urlExternal = 'https://rating-backend-dev.ivs-hp.be-ys.com/usages/external',
            config.token = "classpath:common/Authorization.feature@access_token",
            config.terminologieUrl ="https://rating-backend-dev.ivs-hp.be-ys.com/terminologies/search",
            config.UrlAnnulation ="https://rating-backend-dev.ivs-hp.be-ys.com/usages/cancel",
            config.urlScoringApi = "https://scoring-search-dev.ivs-hp.be-ys.com/scoring-search/searchRules/V2/",
            config.urlpartsCalculation =  "https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation",
            config.urlSharesCalculation =  "https://rating-backend-dev.ivs-hp.be-ys.com/v2/sharesCalculation",
            config.urlBCUMAN =  "https://rating-backend-dev.ivs-hp.be-ys.com/regulation/all",
            config.urlNDM =  "https://rating-backend-dev.ivs-hp.be-ys.com/api/revaluation-Indices"

        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
        // customize
        // e.g. config.foo = 'bar';

    } else if (env === 'devb') {
        config.baseUrl = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/pivot/realtime",
            config.baseUrlVerify = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/verify",
            config.urlSearch = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/usages/search/v1",
            config.baseUrlDecesShares = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/sharesCalculation",
            config.baseUrlDecesParts = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/partsCalculation",
            config.simulateUrl = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/rating/simulate",
            config.urlcancel = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/usages/cancel",
            config.urlCounter ="https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/counter/search",
            config.urlLimit = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/limits/search",
            config.urlExternal = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/usages/external",
            config.token = "classpath:common/Authorization.feature@access_token",
            config.UrlAnnulation ="https://api-rcc.be-ys.com/preRating/devb/usages/cancel",
            config.terminologieUrl ="https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/terminologies/search",
            config.urlScoringApi = "https://back-0-ext.scoring.devb.bcu.openstack.local:8484/scoring-search/searchRules/V2/",
            config.urlSharesCalculation = "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/v2/sharesCalculation",
            config.urlpartsCalculation =  "https://back-pre-rating-0-ext.rating.devb.bcu.openstack.local:8443/v2/partsCalculation"
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );

        // customize
        // e.g. config.foo = 'bar';
    } else if (env === 'recb') {
        config.baseUrlDecesShares = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/sharesCalculation",
            config.baseUrlVerify ="https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/verify",
            config.baseUrlDecesParts = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/partsCalculation",
            config.baseUrl = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/pivot/realtime",
            config.urlSearch ="https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/usages/search/v1",
            config.simulateUrl = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/rating/simulate",
            config.urlcancel = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/usages/cancel",
            config.urlCounter ="https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/counter/search",
            config.urlLimit = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/limits/search",
            config.urlExternal = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/usages/external",
            config.token = "classpath:common/Authorization.feature@access_token_demo",
            config.UrlAnnulation ="https://api-rcc.be-ys.com/preRating/recb/usages/cancel",
            config.terminologieUrl ="https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/terminologies/search", config.token = "classpath:common/Authorization.feature@access_token_demo",
            config.urlSharesCalculation = "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/v2/sharesCalculation",
            config.urlpartsCalculation =  "https://back-pre-rating-0-ext.rating.recb.bcu.openstack.local:8443/v2/partsCalculation"
        karate.log('karate.env system property was:', env );
        config.urlScoringApi = 'https://back-0-ext.scoring.recb.bcu.openstack.local:8484/scoring-search/searchRules/V2/'
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
        // customize
        // e.g. config.foo = 'bar';
    } else if (env === 'local') {
        config.baseUrl = 'http://localhost:8093/pivot/realtime',
            config.baseUrlVerify = "http://localhost:8093/verify",
            config.baseUrlDecesShares = "http://localhost:8093/sharesCalculation",
            config.baseUrlDecesParts = "http://localhost:8093/partsCalculation",
            config.urlSearch ="http://localhost:8093/usages/search/v1",
            config.urlcancel = "http://localhost:8093/usages/cancel",
            config.urlCounter ="http://localhost:8093/counter/search",
            config.urlLimit = "http://localhost:8093/limits/search",
            config.urlExternal = "http://localhost:8093/usages/external",
            config.urlDecesSharesV2 = 'http://localhost:8093/v2/sharesCalculation',
            config.urlGetIndemnisation = 'http://localhost:8093/V2/sharesCalculation/search',
            config.urlDeleteParts = 'http://localhost:8093/v2/sharesCalculation/delete',
            config.token = "classpath:common/Authorization.feature@access_token",
            config.terminologieUrl ="http://localhost:8093/terminologies/search"
        config.simulateUrl = 'http://localhost:8093/rating/simulate',
            config.UrlAnnulation ="http://localhost:8093/usages/cancel",
            config.urlSharesCalculation = "http://localhost:8093/v2/sharesCalculation",
            config.urlpartsCalculation =  "http://localhost:8093/v2/sharesCalculation",
            config.urlScoringApi = "https://scoring-search-dev.ivs-hp.be-ys.com/scoring-search/searchRules/V2/",
            karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
        // customize
    } else if( env === 'demo') {
        config.baseUrl = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/pivot/realtime',
            config.baseUrlVerify = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/verify',
            config.baseUrlDecesShares = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/sharesCalculation',
            config.baseUrlDecesParts = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/partsCalculation',
            config.urlSearch ='https://api-rcc.be-ys.com/ratingEs/demo/usages/search/v1',
            config.urlcancel = 'https://api-rcc.be-ys.com/ratingEs/demo/usages/cancel',
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/rating/simulate',
            config.urlCounter ='https://api-rcc.be-ys.com/ratingEs/demo/counter/search',
            config.urlLimit = 'https://api-rcc.be-ys.com/ratingEs/demo/limits/search',
            config.urlExternal = 'https://api-rcc.be-ys.com/ratingEs/demo/usages/external',
            config.token = 'classpath:common/Authorization.feature@access_token_demo',
            config.terminologieUrl ="https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/terminologies/search",
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/rating/simulate',
            config.urlScoringApi = 'https://back-0-ext.scoring.demo.bcu.openstack.local:8484/scoring-search/searchRules/V2/'
        karate.log('karate.env system property was:', env );
        config.UrlAnnulation ="https://api-rcc.be-ys.com/preRating/demo/usages/cancel",
            config.urlSharesCalculation = "https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/v2/sharesCalculation",
            config.urlpartsCalculation =  "https://back-pre-rating-0-ext.rating.demo.bcu.openstack.local:8443/v2/partsCalculation"
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
    }else if( env === 'rci') {
        config.baseUrlDecesShares = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/sharesCalculation',
            config.baseUrlVerify = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/verify',
            config.baseUrlDecesParts = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/partsCalculation',
            config.baseUrl = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/pivot/realtime',
            config.urlSearch ='https://api-rcc.be-ys.com/ratingEs/rci/usages/search/v1',
            config.urlcancel = 'https://api-rcc.be-ys.com/ratingEs/rci/usages/cancel',
            config.urlCounter ='https://api-rcc.be-ys.com/ratingEs/rci/counter/search',
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/rating/simulate',
            config.urlLimit = 'https://api-rcc.be-ys.com/ratingEs/rci/limits/search',
            config.urlExternal = 'https://api-rcc.be-ys.com/ratingEs/rci/usages/external',
            config.token = "classpath:common/Authorization.feature@token_rci",
            config.terminologieUrl ="https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/terminologies/search",
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/rating/simulate',
            config.urlScoringApi = 'https://back-0-ext.scoring.rci.bcu.openstack.local:8484/scoring-search/searchRules/V2/'
        karate.log('karate.env system property was:', env );
        config.UrlAnnulation ="https://api-rcc.be-ys.com/preRating/rci/usages/cancel",
            config.urlSharesCalculation = "https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/v2/sharesCalculation",
            config.urlpartsCalculation =  "https://back-pre-rating-0-ext.rating.rci.bcu.openstack.local:8443/v2/partsCalculation"
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
    } else if( env === 'rcc') {
        config.baseUrlDecesShares = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/sharesCalculation',
            config.baseUrlVerify = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/verify',
            config.baseUrlDecesParts = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/partsCalculation',
            config.baseUrl = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/pivot/realtime',

            config.urlSearch ='https://api-rcc.be-ys.com/ratingEs/rcc/usages/search/v1',
            config.urlcancel = 'https://api-rcc.be-ys.com/ratingEs/rcc/usages/cancel',
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/rating/simulate',
            config.urlCounter ='https://api-rcc.be-ys.com/ratingEs/rcc/counter/search',
            config.urlLimit = 'https://api-rcc.be-ys.com/ratingEs/rcc/limits/search',
            config.urlExternal = 'https://api-rcc.be-ys.com/ratingEs/rcc/usages/external',
            config.token = "classpath:common/Authorization.feature@token_rcc",
            config.terminologieUrl ="https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/terminologies/search",
            config.simulateUrl = 'https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/rating/simulate',
            config.urlScoringApi = 'https://back-0-ext.scoring.rcc.bcu.openstack.local:8484/scoring-search/searchRules/V2/'
        karate.log('karate.env system property was:', env );
        config.UrlAnnulation ="https://api-rcc.be-ys.com/preRating/rcc/usages/cancel",
            config.urlSharesCalculation = "https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/v2/sharesCalculation",
            config.urlpartsCalculation =  "https://back-pre-rating-0-ext.rating.rcc.bcu.openstack.local:8443/v2/partsCalculation"
        karate.log('karate.env system property was:', env );
        karate.log('karate.URL :', config.baseUrl );
    }
    else if (env === 'reck') {
            config.baseUrl_Rating = 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime',
            config.baseUrlVerify = 'https://rating-backend-rec.ivs-hp.be-ys.com/pivot/realtime',
            config.urlScoringApi = "https://scoring-search-rec.ivs-hp.be-ys.com/scoring-search/searchRules/V2/",
            config.urlBCUMAN = "https://rating-backend-dev.ivs-hp.be-ys.com/regulation/all",
            config.urlNDM = "https://rating-backend-dev.ivs-hp.be-ys.com/api/revaluation-Indices",
            config.token = "classpath:common/Authorization.feature@access_token"


        karate.log('karate.env system property was:', env);
        karate.log('karate.URL :', config.baseUrl);
        // customize
        // e.g. config.foo = 'bar';
    }
    karate.log('================================================================');
    karate.log('================================================================');
    return config;
}