package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import report.CustomExtentReport;

public class RunnerParallelExtentReport {
    @Test
    void testParallel() {
        Results results = Runner.path("classpath:features")
                .tags("@test-request").parallel(4);
//        Extent Report
        CustomExtentReport customExtentReport = new CustomExtentReport().withKarateResult(results).withReportDir(results.getReportDir()).withReportTitle("Karate Test Execution Report");
        customExtentReport.generateExtentReport();
    }
}
