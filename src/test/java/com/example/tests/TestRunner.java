package com.example.tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;

public class TestRunner {

    @Test
    void runAllTests() {
        Results results = Runner.path(

//                        "classpath:Accostage-Rating-CPM/IVSQA-TC-78.feature",
//                                "classpath:Accostage-Rating-CPM/IVSQA-TC-55.feature",
//                                "classpath:Accostage-Rating-CPM/IVSQA-TC-76.feature",
//                                "classpath:Accostage-Rating-CPM/IVSQA-TC-150.feature",
                                "classpath:Accostage-NDM-ORBI/IVSQA-TC-167.feature"


                )
                .outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}