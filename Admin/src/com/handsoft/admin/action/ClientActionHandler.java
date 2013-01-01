package com.handsoft.admin.action;

import com.handsoft.admin.contract.ClientContract;
import com.handsoft.admin.contract.Contract;
import com.handsoft.domain.client.ClientDao;

public class ClientActionHandler implements ActionHandler {
    public void save(Contract contract) {
        if (((ClientContract) contract).getClientId() == null) {
            ClientDao clientDao = new ClientDao();
            clientDao.add(((ClientContract) contract).getClientTitle(), ((ClientContract) contract).getClientWebsite());
        }
    }
}
