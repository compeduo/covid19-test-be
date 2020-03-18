package org.example;

import com.amazonaws.xray.AWSXRay;
import com.amazonaws.xray.AWSXRayRecorderBuilder;
import com.amazonaws.xray.plugins.ElasticBeanstalkPlugin;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletHandler;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

public class Application {
    private static final String INDEX_HTML = loadIndex();

    // Initialize the global AWS XRay Recorder with the Elastic Beanstalk plugin to trace environment metadata

    static {
        AWSXRayRecorderBuilder builder = AWSXRayRecorderBuilder.standard().withPlugin(new ElasticBeanstalkPlugin());
        AWSXRay.setGlobalRecorder(builder.build());
    }

    private static String loadIndex() {
        final String fileName = "/index_default.html";
        try {
            return new Scanner(Application.class.getResourceAsStream(fileName), StandardCharsets.UTF_8).useDelimiter("\\A").next();
        } catch (final Exception exception) {
            return getStackTrace(exception);
        }
    }

    private static String getStackTrace(final Throwable throwable) {
        final StringWriter stringWriter = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(stringWriter, true);
        throwable.printStackTrace(printWriter);

        return stringWriter.getBuffer().toString();
    }

    private static int getPort() {
        return Integer.parseInt(System.getenv().get("PORT"));
    }

    public static void main(String[] args) throws Exception {
        Server server = new Server(getPort());
        ServletHandler handler = new ServletHandler();
        handler.addServletWithMapping(HomeServlet.class, "/*");
        server.setHandler(handler);
        server.start();
        server.join();
    }

    public static class HomeServlet extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("text/html;charset=utf-8");
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().println(INDEX_HTML);
        }
    }
}