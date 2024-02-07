ocpu.seturl("//localhost/ocpu/lib/GEVIS/R")

//some example data
//to run with different data, edit and press Run at the top of the page
var mydata = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];

//call R function: stats::sd(x=data)
$("#submitbutton").click(function(){
    let dataC = [];
    let dataN = [];

    // NESTED FETCH

    fetch('dataC_log.txt')
    .then(response => response.text())
    .then(text => {
        // Parse the data
        const rows = text.trim().split('\n');

        // Map each row to an array of variations
        dataC = rows.map(row => {
            const variations = row.trim().split('\t').map(parseFloat);
            return variations;
        });

        console.log( dataC);

        fetch('dataN_log.txt')
        .then(response => response.text())
        .then(text => {
            // Parse the data
            const rows = text.trim().split('\n');
    
            // Map each row to an array of variations
            dataN = rows.map(row => {
                const variations = row.trim().split('\t').map(parseFloat);
                return variations;
            });
    
            console.log( dataC);
            var req = ocpu.call("hello", {
                dataC: dataC,
                dataN: dataN
            }, function(output){
                // Process the output from R if needed
                console.log("Difference calculated: ", output);
            }); 
            
            // Handle failure of the RPC call
            req.fail(function(){
                console.error("OpenCPU RPC call returned an error: " + req.responseText); 
            });
    
        })
        .catch(error => {
            console.error("Error fetching dataC: ", error);
        });
    
    })
    .catch(error => {
        console.error("Error fetching dataC: ", error);
    });

});