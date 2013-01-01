package com.handsoft.domain.client;

import com.google.appengine.api.datastore.*;

public class ClientDao {
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    public PreparedQuery getAll() {
        Query q = new Query("cms_client");
        PreparedQuery pq = datastore.prepare(q);

        return pq;
    }

    public PreparedQuery getOne(Integer client_id) {
        Query q = new Query("cms_client");
        Query.Filter f = new Query.FilterPredicate(
            "client_id",
            Query.FilterOperator.EQUAL,
            client_id
        );
        q.setFilter(f);

        PreparedQuery pq = datastore.prepare(q);

        return pq;
    }

    public long add(String clientTitle, String clientWebsite) {
        Entity client = new Entity("cms_client");
        client.setProperty("client_title", clientTitle);
        client.setProperty("client_website", clientWebsite);

        Key key = datastore.put(client);

        return key.getId();
    }
}
