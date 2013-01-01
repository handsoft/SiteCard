package com.handsoft.domain.client;

import com.google.appengine.api.datastore.*;

public class ClientDao {
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    public PreparedQuery getAll() {
        Query q = new Query("cms_client");
        PreparedQuery pq = datastore.prepare(q);

        return pq;
    }

    public Entity getOne(Long client_id) {

        Entity entity = new Entity("cms_client", client_id);

        Entity client = null;
        try {
             client = datastore.get(entity.getKey());
        } catch (EntityNotFoundException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        return client;
    }

    public long add(String clientTitle, String clientWebsite) {
        Entity client = new Entity("cms_client");
        client.setProperty("client_title", clientTitle);
        client.setProperty("client_website", clientWebsite);

        Key key = datastore.put(client);

        return key.getId();
    }

    public long save(Long clientId, String clientTitle, String clientWebsite) {
        Entity client = new Entity("cms_client", clientId);

        Key key = null;
        try {
            Entity clientToUpdate = datastore.get(client.getKey());
            clientToUpdate.setProperty("client_title", clientTitle);
            clientToUpdate.setProperty("client_website", clientWebsite);

            key = datastore.put(clientToUpdate);
        } catch (EntityNotFoundException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        return key.getId();
    }

    public void delete(Long clientId) {
        Entity client = new Entity("cms_client", clientId);

        datastore.delete(client.getKey());
    }
}
