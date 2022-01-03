import 'dart:async';

enum CounterEvent { increment, decrement }

class CounterBloc {
  int _counter = 0;

  CounterBloc(){
    _eventController.stream.listen(_mapEventToState);
  }

  final StreamController<CounterEvent> _eventController =
      StreamController<CounterEvent>();

  final StreamController<int> _counterController = StreamController<int>();

  StreamSink get eventSink => _eventController.sink;

  StreamSink get _counterSink => _counterController.sink;

  Stream<int> get counterStream => _counterController.stream;

  void _mapEventToState(CounterEvent event) {
    if(event == CounterEvent.increment){
      _counter++;
    }else{
      _counter--;
    }

    _counterSink.add(_counter);
  }

  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}
