package bdd.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static util.ReportsUtil.generateReport;


public class RunnerParallel {

    private static final Logger logger = LoggerFactory.getLogger(RunnerParallel.class);

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:features").tags("@test-request").parallel(4);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
        generateReport(results.getReportDir());
    }

    @BeforeAll
    static void beforeClass() {
        logger.info("BEFORE >>>>>>>");
    }

    @AfterAll
    static void afterAll() throws IOException {
        logger.info("AFTER >>>>>>>>>>>>>>>>>>>");
    }

}
