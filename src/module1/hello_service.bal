import ballerina/http;
import ballerina/log;

int counter = 0;

@http:ServiceConfig {
    basePath: "/"
}
service hello on new http:Listener(9090) {

    @http:ResourceConfig {
        path: "/"
    }
    resource function sayHello(http:Caller caller, http:Request req) {

        log:printInfo("call received to sayHello. counter = " + counter.toString());
        counter += counter;
        var result = caller->respond("Hello, World!");

        if (result is error) {
            log:printError("Error sending response", result);
        }
    }

    @http:ResourceConfig {
        path: "/bal"
    }
    resource function sayHelloBallerina(http:Caller caller, http:Request req) {

        log:printInfo("call received to sayHelloBallerina. counter = " + counter.toString());
        counter += counter;
        var result = caller->respond("Hello, Ballerina!");

        if (result is error) {
            log:printError("Error sending response", result);
        }
    }
}
