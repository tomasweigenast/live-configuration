import 'package:flutter/material.dart';

class Loader<T> extends StatelessWidget {

  final Future<T?> future;
  final String? loaderText;
  final Widget Function(BuildContext context, T value) onFinish;
  final Widget Function(BuildContext context)? loader;
  final Widget Function(BuildContext context, Object? error)? onError;
  final Widget Function(BuildContext context)? onNull;
  final void Function(T? value)? onFutureCompleted;

  const Loader({required this.future, required this.onFinish, this.loader, this.onFutureCompleted, this.onError, this.onNull, this.loaderText, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
      future: future,
      builder: (context, snapshot) {
        if(snapshot.connectionState != ConnectionState.done) {
          if(loader != null) {
            return loader!(context);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator()
                ),
                if(loaderText != null)
                  ...[
                    const SizedBox(height: 15),
                    Text(loaderText!, style: const TextStyle(fontSize: 20))
                  ]
              ],
            );
          }
        }

        if(snapshot.hasError) {
          return onError != null ? onError!(context, snapshot.error) : const Center(child: Text("An error has ocurred."));
        }

        Future.delayed(Duration.zero, () {
          onFutureCompleted?.call(snapshot.data);
        });

        if(!snapshot.hasData) {
          return onNull != null ? DefaultTextStyle(
            child: Center(child: onNull!(context)),
            style: const TextStyle(fontSize: 20),
          ) : const Center(child: Text("404"));
        }

        return onFinish(context, snapshot.data!);
      },
    );
  }
}