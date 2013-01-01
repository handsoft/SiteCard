package com.handsoft.admin;

import com.handsoft.admin.action.ActionHandler;
import com.handsoft.admin.action.ClientActionHandler;
import com.handsoft.admin.contract.ClientContract;
import com.handsoft.admin.contract.Contract;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminContentManagementServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws IOException {

        String area = req.getParameter("area");
        String action = req.getParameter("action");

        if ("client".equals(area)) {
            if ("add".equals(action) || "edit".equals(action)) {
                Contract contract = new ClientContract(req);
                ActionHandler aHandler = new ClientActionHandler();

                aHandler.save(contract);

                try {
                    resp.sendRedirect("/?area=client&action=list");
                } catch (IOException e) {
                  e.printStackTrace();
                }
            } else if("delete".equals(action)) {
                Contract contract = new ClientContract(req);
                ActionHandler aHandler = new ClientActionHandler();

                aHandler.delete(contract);
                try {
                    resp.sendRedirect("/?area=client&action=list");
                } catch (IOException e) {
                  e.printStackTrace();
                }
            }
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws IOException {

        doGet(req, resp);
    }
}
