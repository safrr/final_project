package com.safronova.webproject.controller.command;

import jakarta.servlet.http.HttpServletRequest;

public interface Command {
    Router execute(HttpServletRequest request);
}
