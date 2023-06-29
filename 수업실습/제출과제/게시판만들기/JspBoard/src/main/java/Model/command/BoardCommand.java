package Model.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface BoardCommand {
    
    void execute(HttpServletRequest request, HttpServletResponse response);

}
