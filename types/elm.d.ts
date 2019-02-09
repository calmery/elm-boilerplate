declare module '*.elm' {

  namespace Elm {
    interface Module {
      Main: Main;
    }

    interface Main {
      init: InitialFunction;
    }

    type InitialFunction = (options: InitialFunctionOptions) => Application;

    interface InitialFunctionOptions {
      flags?: string;
      node: HTMLElement;
    }

    interface Application {
      ports?: Ports;
    }

    interface Ports {
      [_: string]: Ports.Subscribable | Ports.Sendable;
    }

    namespace Ports {
      interface Subscribable {
        subscribe: SubscribeFunction;
        unsubscribe: UnsubscribeFunction;
      }

      interface Sendable {
        send: SendFunction;
      }

      type SubscribeFunction = (data: any) => void;
      type UnsubscribeFunction = () => void;
      type SendFunction = (data: any) => void;
    }
  }

  export const Elm: Elm.Module;

}
