$(function () {
    var ws = new WebSocket('ws://<<<HOST>>>:<<<PORT>>>/echo2');
    ws.onopen = function () {
        log('connected');
    };
}
