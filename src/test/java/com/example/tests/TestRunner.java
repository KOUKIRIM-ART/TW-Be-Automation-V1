package com.example.tests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;

public class TestRunner {

    @Test
    void runAllTests() {
        Results results = Runner.path(

                             "classpath:Accostage-CPM-NDM",
                                    "classpath:Accostage-DC-NDM",
                                    "classpath:Accostage-NDM-ORBI",
                                    "classpath:Accostage-Rating-CPM",
                                    "classpath:Accostage-SME"


                )
                .outputCucumberJson(true)
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}