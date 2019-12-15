document.addEventListener('turbolinks:load', () => {
    let control = document.querySelector('.sort-by-title');

    if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle() {
    let table       = document.querySelector('table');
    let rows        = table.querySelectorAll('tr');

    let arrowUp     = this.querySelector('.octicon-arrow-up');
    let arrowDown   = this.querySelector('.octicon-arrow-down');

    let sortedTable = document.createElement('table');
    let sortedRows  = [];

    sortedTable.classList.add('table');

    for (let i = 1; i < rows.length; i++){
        sortedRows.push(rows[i]);
    }

    if (arrowUp.classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc);

        arrowUp.classList.remove('hide');
        arrowDown.classList.add('hide');
    }
    else{
        sortedRows.sort(compareRowsDesc);

        arrowDown.classList.remove('hide');
        arrowUp.classList.add('hide');
    }

    sortedTable.appendChild(rows[0]);

    for (let i = 0; i < sortedRows.length; i++){
        sortedTable.appendChild(sortedRows[i])
    }

    table.parentNode.replaceChild(sortedTable, table)

}

let compareRowsAsc = (row1, row2) => {
    let testTitle1 = row1.querySelector('td').textContent;
    let testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
};

let compareRowsDesc = (row1, row2) => {
    let testTitle1 = row1.querySelector('td').textContent;
    let testTitle2 = row2.querySelector('td').textContent;

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
};
