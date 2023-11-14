async function query(pool, query, queryArgs) {
  const { rows, rowCount } = await pool.query(query, queryArgs);
  if (rowCount > 0) return { rows };
  return null;
}

function createRepo(pool) {
  const read = {
    customerVehicleById: async function (id) {
      const results = await query(
        pool,
        "select * from customer_vehicle where reg_number = $1;",
        [id]
      );
      if (results) return results.rows[0];
      return "NO Customer Vehicle Found with REG_NUMBER: " + id;
    },
    customerVehiclesByCustomerId: async function (customerId) {
      const results = await query(
        pool,
        "select * from customer_vehicle where customer_id = $1",
        [customerId]
      );
      if (results) return results.rows;
      return (
        "Either The Customer does not have any vehicle or there is no customer with id : " +
        customerId
      );
    }
  };
}
