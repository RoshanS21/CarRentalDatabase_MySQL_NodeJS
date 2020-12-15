var express = require("express");
var app = express();
var bodyParser = require("body-parser");
var multer = require("multer");
var upload = multer();

var mysql = require("mysql");
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password",
  database: "phase3"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", null); // update to match the domain you will make the request from
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});
app.use(bodyParser.json());

// for parsing application/xwww-
app.use(bodyParser.urlencoded({ extended: true }));
//form-urlencoded

// for parsing multipart/form-data
app.use(upload.array());
app.post("/save", (req, res) => {
  if (req.body.tag == 1) {
    var sql =
      "INSERT INTO customer (Name, Phone) VALUES ('" +
      req.body.name +
      "', '" +
      req.body.phone +
      "')";
    con.query(sql, function(err, result) {
      if (err) throw err;
      console.log("1 record inserted");
      res.send("<h1>SERVER IS RUNNING</h1>");
    });
  } else if (req.body.tag == 2) {
    var sql =
      "INSERT INTO vehicle (VehicleID, Description, Year, Type, Category) VALUES ('" +
      req.body.vid +
      "', '" +
      req.body.vdis +
      "', '" +
      req.body.year +
      "', '" +
      req.body.type +
      "', '" +
      req.body.cat +
      "')";

    con.query(sql, function(err, result) {
      if (err) throw err;
      console.log("1 record inserted");
      res.send("<h1>SERVER IS RUNNING</h1>");
    });
  }
});
app.post("/saverental", (req, res) => {
    var sqlrental = "insert into rental (CustID, VehicleID, StartDate, ReturnDate, PaymentDate,Returned) values ('"+req.body.renter_customer+"','"+req.body.renter_vehicle+"','"+req.body._start_search+"','"+req.body._return_search+"','"+req.body._odi_search+"',0);"

    con.query(sqlrental, function(err, result) {
      if (err) throw err;
      console.log("1 record inserted");
      res.send("<h1>SERVER IS RUNNING</h1>");
    });
  } 
);

//
//return rental 
app.post("/retSelectRETURN", (req, res) => {
  var sqlrental = "UPDATE rental as r  SET Returned = '1'  where r.VehicleID = '"+req.body._VID_search+"' and r.ReturnDate = '"+req.body._return_date_search+"'  and r.CustID in ( select c.CustID  from customer as c   where c.Name = '"+req.body._customer_name2+"');"

  con.query(sqlrental, function(err, result) {
    if (err) throw err;
    console.log("1 record inserted");
    res.send("<h1>SERVER IS RUNNING</h1>");
  });
} 
);
//

//select Name ,  sum(TotalAmount) as balance from customer c, rental r where r.CustID = c.CustID AND c.Name like '%"+req.body.searchParam+"%' group by Name
//select c.Name, sum(r.TotalAmount) as balance from customer as c,rental asr where c.Name like '%"+req.body.searchParam+"%' and r.CustID = c.CustID group by c.Name"; // '%"+req.body.searchParam+"%'
// for selected customer kushal
app.post("/retSelect", (req, res) => {
  var query3 = "select c.CustID , c.Name, case when sum(r.TotalAmount)  is null then 0  when sum(r.TotalAmount) is not null then sum(r.TotalAmount) end as balance  from customer as c LEFT OUTER JOIN  rental as r on c.CustID = r.CustID where c.Name like '%"+req.body.searchParam+"%' group by Name order by balance desc;";
  fetchDataCollective(query3,function(data) {
  res.send(data);
  console.log("Done. Display Data!");
  });

});
// for search customer like with balance///////////////

/////////////////




function fetchDataCollective(query3, callback) {
  executeQuery(query3, function(result) {
    callback(result);
  });
}




// ret selecr for customer id
app.post("/retSelectid", (req, res) => {
  var query44 = "select c.CustID , c.Name, case when sum(r.TotalAmount)  is null then 0  when sum(r.TotalAmount) is not null then sum(r.TotalAmount) end as balance  from customer as c LEFT OUTER JOIN  rental as r on c.CustID = r.CustID where c.CustID = '"+req.body.searchParamid+"'  group by Name order by balance desc;";
  fetchDataCollectiveid(query44,function(data) {
  res.send(data);
  console.log("Done. Display Data!");
  });
function fetchDataCollectiveid(query44, callback) {
    executeQuery(query44, function(result) {
      callback(result);
    });
  }

});

//ret vehicle select
app.post("/retVehSelect", (req, res) => {
  var queryV1 = "select v.VehicleID, v.Description, ra.Daily as Daily from vehicle as v, rate as ra where v.Description like '%"+req.body.searchParamVEH+"%' AND  v.Type = ra.Type AND v.Category = ra.Category;";
  fetchDataCollectiveVEH(queryV1,function(data) {
  res.send(data);
  console.log("Done. Display Data!");
  });

});


function fetchDataCollectiveVEH(queryV1, callback) {
  executeQuery(queryV1, function(result) {
    callback(result);
  });
}
//
//IDID VEH
app.post("/retVehSelectID", (req, res) => {
  var queryVID = "select v.VehicleID, v.Description, ra.Daily as Daily from vehicle as v, rate as ra where v.VehicleID = '"+req.body.searchParamVEHID+"' AND  v.Type = ra.Type AND v.Category = ra.Category;";
  fetchDataCollectiveVEHID(queryVID,function(data) {
  res.send(data);
  console.log("Done. Display Data!");
  });

});


function fetchDataCollectiveVEHID(queryVID, callback) {
  executeQuery(queryVID, function(result) {
    callback(result);
  });
}
//
app.post("/retVehSelectRENTAL", (req, res) => {
  var queryRN = "(select v.VehicleID, v.Description from rental r natural join vehicle v where v.Type = '"+req.body.searchParamTYPE+"' and v.Category = '"+req.body.searchParamCAT+"' and (('"+req.body.searchParamSTART+"' not between r.StartDate and r.returnDate) and ('"+req.body.searchParamSTART+"' not between r.StartDate and r.returnDate))) union (select v.VehicleID, v.Description  from vehicle v where v.Type = '"+req.body.searchParamTYPE+"' and v.Category = '"+req.body.searchParamCAT+"' and v.VehicleID not in (select r.VehicleID from rental r));";
  fetchDataCollectiveVEHR(queryRN,function(data) {
  res.send(data);
  console.log("Done. Display Data!");
  });

});


function fetchDataCollectiveVEHR(queryRN, callback) {
  executeQuery(queryRN, function(result) {
    callback(result);
  });
}
//

/*
function fetchDataCollective2(query4, callback) {
  executeQuery(query4, function(result) {
    callback(result);
  });
}
*/




app.get("/ret", function(req, res) {
  fetchData(function(data) {
    res.send(data);
    console.log("Done. Display Data!");
  });
});




function executeQuery(sql, cb) {
  con.query(sql, function(error, result, fields) {
    if (error) {
      throw error;
    }
    cb(result);
  });
}

function fetchData(callback) {
  executeQuery("Select * from customer", function(result) {
    callback(result);
  });
}








app.get("/ret2", function(req, res) {
  fetchData2(function(data) {
    res.send(data);
    console.log("Done. Display Data!");
  });
});

function fetchData2(callback) {
  executeQuery("Select * from Vehicle", function(result) {
    callback(result);
  });
}

app.get("/ret3", function(req, res) {
  fetchData3(function(data) {
    res.send(data);
    console.log("Done. Display Data!");
  });
});

function fetchData3(callback) {
  executeQuery(
    "select Name , sum(TotalAmount) as balance from customer c, rental r where r.CustID = c.CustID group by Name",
    function(result) {
      callback(result);
    }
  );
}

app.get("/ret4", function(req, res) {
  fetchData4(function(data) {
    res.send(data);
    console.log("Done. Display Data!");
  });
});

function fetchData4(callback) {
  executeQuery(
    "select Description , Daily  from vehicle v, rate ra where v.Type = ra.Type AND v.Category = ra.Category group by Description",
    function(result) {
      callback(result);
    }
  );
}

app.listen(3000, () => {
  console.log("Sever has started on port 3000");
});
