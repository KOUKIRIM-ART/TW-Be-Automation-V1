package com.example.tests;

import com.intuit.karate.junit5.Karate;

public class Test {

    @Karate.Test
    Karate runTestsAccostage_CPM_NDM() {
        return Karate.run("classpath:Accostage-CPM-NDM");
    }
  

    @Karate.Test
    Karate runTestAccostage_NDM_ORBI() {
        return Karate.run("classpath:Accostage-NDM-ORBI");
    }
    @Karate.Test
    Karate runTestAccostage_Rating_CPM() {
        return Karate.run("classpath:Accostage-Rating-CPM");
    }
    @Karate.Test
    Karate runTestAccostage_SME() {
        return Karate.run("classpath:Accostage-SME");
    }
}
