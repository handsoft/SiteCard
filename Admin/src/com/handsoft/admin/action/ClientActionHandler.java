package com.handsoft.admin.action;

import com.handsoft.admin.contract.ClientContract;
import com.handsoft.admin.contract.Contract;
import com.handsoft.domain.client.ClientDao;

public class ClientActionHandler implements ActionHandler {
    public void save(Contract contract) {
        ClientDao clientDao = new ClientDao();
        String clientTitle = ((ClientContract) contract).getClientTitle();
        String clientWebsite = ((ClientContract) contract).getClientWebsite();
        String clientId = ((ClientContract) contract).getClientId();
        if (clientId == null || "0".equals(clientId)) {
            clientDao.add(clientTitle, clientWebsite);
        } else {
            clientDao.save(Long.parseLong(clientId), clientTitle, clientWebsite);
        }
    }

    public void delete(Contract contract) {
        ClientDao clientDao = new ClientDao();
        String clientId = ((ClientContract) contract).getClientId();

        clientDao.delete(Long.parseLong(clientId));
    }
}
