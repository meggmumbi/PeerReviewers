$(document).ready(function () {
    $("body").delegate("#dataTables-example .btnInsertCmps", "click", function (event) {
        //To prevent form submit after ajax call
        event.preventDefault();
        //Loop through the Table rows and build a JSON array.
        var allrfqitems = new Array();
        $("#dataTables-example TBODY TR").each(function () {
            var row = $(this);
            var onerfqitem = {};
            onerfqitem.evalNo = $("#txtapplicationCode").val();
            onerfqitem.applicationNo = $("#txtjobNo").val();
            onerfqitem.mystatus = $("#txtmystatus").val();
            onerfqitem.component = $("#txtcomponentCode").val();
            onerfqitem.subcomponent = row.find("TD input").eq(0).val();
            onerfqitem.strength = row.find("TD input").eq(1).val();
            onerfqitem.weakness = row.find("TD input").eq(2).val();
            onerfqitem.recommendation = row.find("TD input").eq(3).val();
            onerfqitem.maximumscore = row.find("TD textarea").eq(1).val();
            onerfqitem.score = row.find("TD input").eq(4).val();
            allrfqitems.push(onerfqitem);

        });

        $.ajax({
            type: "POST",
            url: "Sub_Components.aspx/InsertComponentItems",
            data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (status) {
                switch (status.d) {
                    case "success":
                        Swal.fire
                        ({
                            title: "Items Added!",
                            text: "Evaluation comments saved successfully!",
                            type: "success"
                        }).then(() => {
                            $("#feedback").css("display", "block");
                            $("#feedback").css("color", "green");
                            $('#feedback').attr("class", "alert alert-success");
                            $("#feedback").html("The Evaluation comments have been saved successfully, kindly click the 'Back' button to add more eveluation comments");
                        });
                        break;

                    case "componentnull":
                        Swal.fire
                        ({
                            title: "Component not filled!",
                            text: "Component field empty!",
                            type: "danger"
                        }).then(() => {
                            $("#feedback").css("display", "block");
                            $("#feedback").css("color", "red");
                            $('#feedback').attr("class", "alert alert-danger");
                            $("#feedback").html("Component field empty!");
                        });
                        break;
                    default:
                        Swal.fire
                        ({
                            title: "An Error Occured!!!",
                            text: "Kindly click 'OK' to view the error",
                            type: "error"
                        }).then(() => {
                            $("#feedback").css("display", "block");
                            $("#feedback").css("color", "red");
                            $('#feedback').addClass('alert alert-danger');
                            $("#feedback").html(status.d);
                        });

                        break;
                }
            },
            error: function (err) {
                console.log(err.statusText);
                console.log(status.d);
            }

        });

        console.log(allrfqitems);

    });
});