const serverURL = 'http://localhost:4000';


async function render(view){
    let main = document.querySelector('main');
    main.innerHTML = await (await fetch(`Views/${view}.html`)).text();
}



    render('newdata');


function getAllCategory() {
    axios.get(`${serverURL}/mock_data`)
        .then(res => {
            let select1 = document.getElementById("select1");
            let select2 = document.getElementById("select2");

            let categoryList = [];
            let productList = [];
            let priceList = [];

            res.data.forEach(item => {
                if (!categoryList.includes(item.category)) {
                    var option1 = document.createElement("option");
                    option1.setAttribute("value", item.category);
                    option1.text = item.category;
                    select1.appendChild(option1);
                    categoryList.push(item.category);
                }

                var option2 = document.createElement("option");
                option2.setAttribute("value", item.productname);
                option2.setAttribute("data-category", item.category);
                option2.setAttribute("data-price", item.price); 
                option2.text = item.productname;
                select2.appendChild(option2);
                productList.push(item.productname);
                priceList.push(item.price);
            });

            // Betöltjük az adatbázisban lévő adatokat
            axios.get(`${serverURL}/lista`)
                .then(response => {
                    const data = response.data;
                    const table = document.querySelector("table tbody");
                    table.innerHTML = ""; // Töröljük a táblázat tartalmát

                    data.forEach(rowData => {
                        const newRow = document.createElement("tr");
                        newRow.innerHTML = `
                            <td>${rowData.id}</td>
                            <td>${rowData.category}</td>
                            <td>${rowData.productname}</td>
                            <td>${rowData.amount}</td>
                            <td>${rowData.unitprice}</td>
                            <td>${rowData.price}</td>
                            <td>
                                <button type="button" class="btn btn-danger" onclick="deleteRow(this)">Törlés</button>
                                <button type="button" class="btn btn-primary" onclick="editRow(this)">Módosítás</button>
                            </td>
                        `;
                        table.appendChild(newRow);
                    });

                    // Frissítjük az összesített árat
                    updateTotalPrice();
                })
                .catch(error => {
                    console.error("Hiba az adatok betöltése során:", error);
                });
        })
        .catch(error => {
            console.error("hiba az adatok lekérése során:", error);
        });
}

getAllCategory();
//SZENVEDÉS
function Match() {
    
    let select1 = document.getElementById("select1");
    let select2 = document.getElementById("select2");
    let ar = document.getElementById("ar");
    let aras = document.getElementById("aras");

    
    let selectedProduct = select2.options[select2.selectedIndex];
    let selectedCategory = selectedProduct.getAttribute("data-category");
    let selectedPrice = selectedProduct.getAttribute("data-price");

    //Meglévő opciók törlése a select1 mezőből
    select1.innerHTML = '';
    ar.innerHTML = '';

    // Töltsük fel a select1 mezőt a kiválasztótt termék kategóriájával
    var option = document.createElement("option");
    option.setAttribute("value", selectedCategory);
    option.text =selectedCategory;
    select1.appendChild(option);


    
    ar.setAttribute("value",selectedPrice);
    ar.text = selectedPrice;
    aras.appendChild(ar);
}



function addProduct() {
    // Először le kell kérni a kiválasztott terméket és a mennyiséget
    let select2 = document.getElementById("select2");
    let selectedProduct = select2.options[select2.selectedIndex].value;
    let quantity = document.getElementById("amount").value;
    let unitprice = document.getElementById("ar").value;
    let price = unitprice*quantity;

    // Ellenőrizzük, hogy van-e termék kiválasztva és meg van-e adva a mennyiség
    if (selectedProduct === "" || quantity === "") {
        alert("Kérjük válassza ki a terméket és adjon meg egy mennyiséget!");
        return;

        
    }

    // Ellenőrizzük, hogy a megadott mennyiség érvényes szám-e
    if (isNaN(quantity) || parseInt(quantity) <= 0) {
        alert("Kérjük adjon meg egy érvényes mennyiséget!");
        return;
    }

    // Ellenőrizzük, hogy a termék már szerepel-e a táblázatban
    let table = document.querySelector("table tbody");
    let existingRows = table.querySelectorAll("tr");
    let isNewProduct = true;
    let rowIndexToUpdate = -1;

    for (let i = 0; i < existingRows.length; i++) {
        let cells = existingRows[i].querySelectorAll("td");
        let productNameCell = cells[2];
        if (productNameCell.textContent === selectedProduct) {
            isNewProduct = false;
            rowIndexToUpdate = i;
            break;
        }
    }

    // Ha a termék már szerepel a táblázatban, frissítjük az adatokat
    if (!isNewProduct && rowIndexToUpdate !== -1) {
        let cellsToUpdate = existingRows[rowIndexToUpdate].querySelectorAll("td");
        cellsToUpdate[3].textContent = quantity;
        cellsToUpdate[4].textContent = unitprice;
        cellsToUpdate[5].textContent = price;
        
    } else {
        // Ha a termék még nem szerepel a táblázatban, hozzáadjuk az új sort
        let newRow = document.createElement("tr");
        newRow.innerHTML = `
            <td>${existingRows.length + 1}</td>
            <td>${document.getElementById("select1").value}</td>
            <td>${selectedProduct}</td>
            <td>${quantity}</td>
            <td>${unitprice}</td>
            <td>${price}</td>
            <td >
                <button type="button" class="btn btn-danger col" onclick="deleteRow(this)">Törlés</button>
                <button type="button" class="btn btn-primary col" onclick="editRow(this) ">Módosítás</button>
            </td>
        `;
        table.appendChild(newRow);
    }

    // Töröljük a mennyiség mező tartalmát
    document.getElementById("amount").value = "";
    updateTotalPrice();
}

function saveListToDatabase() {
    //BAROMI NAGY SZENVEDÉS
    // Először töröljük az adatbázist
    axios.delete(`${serverURL}/lista`)
        .then(res => {
            console.log("Az adatbázis sikeresen törölve");
            
            // A törlés után új adatokat mentünk
            let tableRows = document.querySelectorAll("table tbody tr");
            let id = 1;
            let dataToSend = [];
            tableRows.forEach(row => {
                let cells = row.querySelectorAll("td");
                let rowData = {
                    id: id++,
                    category: cells[1].textContent,
                    productname: cells[2].textContent,
                    amount: cells[3].textContent,
                    unitprice: cells[4].textContent,
                    price: cells[5].textContent
                };
                dataToSend.push(rowData);
           
                

            // Az új adatokat mentjük az adatbázisba
            axios.post(`${serverURL}/lista`, rowData)
                .then(response => {
                    console.log("Az adatbázis sikeresen feltöltve:", response.data);
                })
                .catch(error => {
                    console.error("Hiba az adatbázis mentése során:", error);
                });
            });
            // Frissítjük az összesített árat a táblázat mentése után
            updateTotalPrice();
        })
        .catch(error => {
            console.error("Hiba az adatbázis törlése során:", error);
        });

        alert("A lista sikeresen mentve az adatbázisba!");


}

// Töröljük a sor függvény
function deleteRow(button) {
    let row = button.closest("tr");
    row.remove();
    updateRowNumbers();
    updateTotalPrice();
}

// Módosítjuk a sort függvény
function editRow(button) {
   
    let row = button.closest("tr");
    let cells = row.querySelectorAll("td");

//NEM JELENIK MEG A SELECT1 !!!!!! DE MŰKÖDIK
    document.getElementById("select1").value = cells[1].textContent;
    document.getElementById("select2").value = cells[2].textContent;
    document.getElementById("amount").value = cells[3].textContent;
    document.getElementById("ar").value = cells[4].textContent;

    
    updateRowNumbers();
    updateTotalPrice();
}

// Sorok számának frissítése
function updateRowNumbers() {
    let table = document.querySelector("table tbody");
    let rows = table.querySelectorAll("tr");
    rows.forEach((row, index) => {
        let cells = row.querySelectorAll("td");
        cells[0].textContent = index + 1;
    });
}

// Összesített ár frissítése
function updateTotalPrice() {
    let table = document.querySelector("table tbody");
    if (!table) return;

    let rows = table.querySelectorAll("tr");
    let totalPrice = 0;
    rows.forEach(row => {
        let cells = row.querySelectorAll("td");
        let price = parseFloat(cells[5].textContent);
        totalPrice += price;
    });

    document.getElementById("price").value = totalPrice.toFixed(2);
}

// Összesített ár frissítése az oldal betöltésekor SZENVEDÉS
document.addEventListener("DOMContentLoaded", updateTotalPrice);

function Delete(){
    let tableBody = document.querySelector("table tbody");
    tableBody.innerHTML = "";


    axios.delete(`${serverURL}/lista`)
        .then(res => {
            console.log("Az adatbázis sikeresen törölve");
        })

        document.getElementById("price").value ="0.00";
}




