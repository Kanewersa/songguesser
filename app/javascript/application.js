// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const loadAnimation = () => {
    const calculateTime = () => {
        let seconds = secondsDifference;
        let minutes = Math.floor(seconds / 60);
        let hours = Math.floor(minutes / 60);
        let days = Math.floor(hours / 24);

        hours %= 24;
        minutes %= 60;
        seconds %= 60;

        let data;

        // Fill days
        days_1.innerHTML = days.toString();
        // Fill hours
        data = hours.toString().split('');
        data.length === 1 ? data.unshift('0') : null;
        hours_1.innerHTML = data[0];
        hours_2.innerHTML = data[1];
        // Fill minutes
        data = minutes.toString().split('');
        data.length === 1 ? data.unshift('0') : null;
        minutes_1.innerHTML = data[0];
        minutes_2.innerHTML = data[1];
        // Fill seconds
        data = seconds.toString().split('');
        data.length === 1 ? data.unshift('0') : null;
        seconds_1.innerHTML = data[0];
        seconds_2.innerHTML = data[1];

        secondsDifference -= 1
    }

    let secondsDifference = document.getElementById('init-seconds').innerText;

    let days_1 = document.getElementById('days');
    let minutes_1 = document.getElementById('minutes-1');
    let minutes_2 = document.getElementById('minutes-2');
    let hours_1 = document.getElementById('hours-1');
    let hours_2 = document.getElementById('hours-2');
    let seconds_1 = document.getElementById('seconds-1');
    let seconds_2 = document.getElementById('seconds-2');

    let timer = setInterval(calculateTime, 1000);
    secondsDifference = parseInt(secondsDifference) + 1;
    calculateTime();
}

let animation = document.getElementById('animation');

if (animation) {
    loadAnimation();
}
