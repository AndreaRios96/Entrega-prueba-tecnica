var path = "http://127.0.0.1:4000";

window.addEventListener('load', function() {
    api();
    setTimeout(() => {location.reload()}, 100000);
});

addEventListener('load', (event) => {

    var textWrapper = document.querySelector('.ml9 .letters');
    textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
    
    anime.timeline({loop: true})
      .add({
        targets: '.ml9 .letter',
        scale: [0, 1],
        duration: 1500,
        elasticity: 600,
        delay: (el, i) => 45 * (i+1)
      }).add({
        targets: '.ml9',
        opacity: 0,
        duration: 1000,
        easing: "easeOutExpo",
        delay: 1000
      });
});

function MakeGraph(vecMemory, vecCpu, vecDisk, devices){    
    const chart = document.getElementById('myChart');
    Chart.defaults.color = "#FFFFFF";

    var Memory = {
        label: '% Memory RAM',
        data: vecMemory,
        backgroundColor:  '#01C758',
    }

    var Cpu = {
        label: '% CPU',
        data: vecCpu,
        backgroundColor:  '#01C758',
    }
    
    var Disk = {
        label: '% DISK',
        data: vecDisk,
        backgroundColor:  '#01C758',
    }

    var myChartAll = new Chart(chart, {
        type: 'bar',
        responsive: true,
        data: {
            labels: devices,
            datasets: [Memory, Cpu, Disk],
        },
        options: {
            indexAxis: 'y',
            scales: {
                y: {
                grid: {
                    color: 'rgb(0, 181, 226)'
                }
                },
                x: {
                grid: {
                    color: 'rgb(0, 181, 226)'
                }
                }
            }
        },
    });
}

function api() {

    fetch(path + "/monitoring_system/get-list-data",{
        method: 'POST',
        // body: JSON.stringify({"data": data, "type": type}),
        headers:{
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        }
    }).then(res => res.json())
    .catch(error => console.log('Error:', error))
    .then(res=> {
        MakeGraph(res.vecMemory, res.vecCpu, res.vecDisk, res.vecHost);
        for (let i = 0; i < res.devices.length; i++) {
            document.getElementById('ip-'+(i+1)).innerText=(res.devices[i][0]).toUpperCase();
            document.getElementById('host-'+(i+1)).innerText=(res.devices[i][1]).toUpperCase();
            document.getElementById('memory-'+(i+1)).innerText=(res.devices[i][2]).toUpperCase();
            document.getElementById('cpu-'+(i+1)).innerText=(res.devices[i][3]).toUpperCase();
            document.getElementById('disk-'+(i+1)).innerText=(res.devices[i][4]).toUpperCase();
            document.getElementById('time-'+(i+1)).innerText=(res.devices[i][5]).toUpperCase();

            if (parseFloat(res.devices[i][2]) >= 75 || parseFloat(res.devices[i][3]) >= 75 || parseFloat(res.devices[i][4]) >= 75){
                document.getElementById('tr-'+(i+1)).style.background = "#ef6c00";
            }

        }
        for (let i = 0; i < res.Count.length; i++){
            document.getElementById('notify-'+(i+1)).innerText=(res.Count[i]);
        }
    });
}