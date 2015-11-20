$(function () {
    var ws = new WebSocket( wsUrl() );
    ws.onopen = function () {
        log('connected');
    };
}
