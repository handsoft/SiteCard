package com.handsoft.admin.contract;

import javax.servlet.http.HttpServletRequest;

public class ClientContract implements Contract {
    private String clientId;
    private String clientTitle;
    private String clientWebsite;

    public ClientContract(HttpServletRequest req) {
        this.clientId = req.getParameter("client_id");
        this.clientTitle = req.getParameter("client_title");
        this.clientWebsite = req.getParameter("client_website");
    }

    public String getClientTitle() {
        return clientTitle;
    }

    public void setClientTitle(String clientTitle) {
        this.clientTitle = clientTitle;
    }

    public String getClientWebsite() {
        return clientWebsite;
    }

    public void setClientWebsite(String clientWebsite) {
        this.clientWebsite = clientWebsite;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }
}
