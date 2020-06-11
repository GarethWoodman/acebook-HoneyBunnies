# `Create a Component with Composition`

Imagine you are building an App and have created three components, a `Navbar`, `Dashboard`, and `Footer`.

To compose these components together, you could create an `App` parent component which renders each of these three components as children.

To render a component as a child in a React component, you include the component name written as a custom HTML tag in the JSX. For example, in the render method you could write:

```js
return (
 <App>
  <Navbar />
  <Dashboard />
  <Footer />
 </App>
)
```

```js
const ChildComponent = () => {
  return (
    <div>
      <p>I am the child</p>
    </div>
  );
};

class ParentComponent extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div>
        <h1>I am the parent</h1>
        <ChildComponent />
      </div>
    );
  }
};
```

# Use React to Render Nested Components

**Component composition** is one of React's powerful features.

When you work with React, it is important to start thinking about your user interface in terms of components like the App example in the last challenge.

You break down your UI into its basic building blocks, and those pieces become the components.

```js
const TypesOfFruit = () => {
  return (
    <div>
      <h2>Fruits:</h2>
      <ul>
        <li>Apples</li>
        <li>Blueberries</li>
        <li>Strawberries</li>
        <li>Bananas</li>
      </ul>
    </div>
  );
};

const Fruits = () => {
  return (
    <div>
      <TypesOfFruit />
    </div>
  );
};

class TypesOfFood extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Types of Food:</h1>
        <Fruits />
      </div>
    );
  }
};
```

# Compose React Components

Rendering ES6 style class components within other components is no different than rendering the simple components you used in the last few challenges.

You can render JSX elements, stateless functional components, and ES6 class components within other components.

```js
class Fruits extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div>
        <h2>Fruits:</h2>
        <NonCitrus />
        <Citrus />
      </div>
    );
  }
};

class TypesOfFood extends React.Component {
  constructor(props) {
     super(props);
  }
  render() {
    return (
      <div>
        <h1>Types of Food:</h1>
        <Fruits />
        <Vegetables />
      </div>
    );
  }
};
```

# Render a Class Component to the DOM

`ReactDOM.render(componentToRender, targetNode)`

The first argument is the `React component` that you want to render. The second argument is the `DOM node` that you want to render that component within.

React components are passed into `ReactDOM.render()` a little differently than JSX elements.

For JSX elements, you pass in the `name of the element` that you want to render. However, for React components, you need to use the same syntax as if you were rendering a nested component, for example `ReactDOM.render(<ComponentToRender />, targetNode)`. You use this syntax for both ES6 class components and functional components.

```js
class TypesOfFood extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div>
        <h1>Types of Food:</h1>
        <Fruits />
        <Vegetables />
      </div>
    );
  }
};

ReactDOM.render(<TypesOfFood />, document.getElementById('challenge-node'))
```

# `Pass Props to a Stateless Functional Component`

In React, you can pass `props`, or properties, to child components. Say you have an `App component` which renders a child component called `Welcome` which is a stateless functional component.

You can pass Welcome a `user` property by writing:

```js
<App>
  <Welcome user='Mark' />
</App>
```

Since **Welcome** is a `stateless functional component`, it has access to this value like so:

```js
const Welcome = (props) => <h1>Hello, {props.user}!</h1>
```

It is standard to call this value props and when dealing with stateless functional components, you basically consider it as an argument to a function which returns JSX.

```js
const CurrentDate = (props) => {
  return (
    <div>
      <p>The current date is: {props.date}</p>
    </div>
  );
};

class Calendar extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    return (
      <div>
        <h3>What date is it?</h3>
        <CurrentDate date={Date()}/>
      </div>
    );
  }
};
```

# `Use Default Props`

You can assign default props to a component as a property on the component itself and React assigns the default prop if necessary.

React assigns default props if props are undefined, but if you pass null as the value for a prop, it will remain null.

```js
const ShoppingCart = (props) => {
  return (
    <div>
      <h1>Shopping Cart Component</h1>
    </div>
  )
};

ShoppingCart.defaultProps = {items: 0}
```

# Access Props Using `this.props`

Anytime you refer to a class component within **itself**, you use the `this` keyword.

To access `props` within a class component, you preface the code that you use to access it with `this`.

For example, if an ES6 class component has a `prop` called `data`, you write `{this.props.data}` in JSX.

```js
class ReturnTempPassword extends React.Component {
  constructor(props) {
    super(props);

  }
  render() {
    return (
        <div>
            <p>Your temporary password is: <strong>{this.props.tempPassword}</strong></p>
        </div>
    );
  }
};

class ResetPassword extends React.Component {
  constructor(props) {
    super(props);

  }
  render() {
    return (
        <div>
          <h2>Reset Password</h2>
          <h3>We have generated a new temporary password for you.</h3>
          <h3>Please reset this password from your account settings ASAP.</h3>
          <ReturnTempPassword tempPassword={'passwordisstrong'} />
        </div>
    );
  }
};
```

# `Review`

A `stateless functional component` is any function you write which accepts props and returns JSX.

A `stateless component`, on the other hand, is a class that extends `React.Component`, but does not use internal state.

Finally, a `stateful component` is a class component that does maintain its own internal state.


# `Stateful Component`

You create `state` in a React component by declaring a `state property` on the component class in its **constructor**.

This initializes the component with state when it is created. The state property **must be set to a JavaScript object**.

```js
this.state = {
  // describe your state here
}
```

Note that **you must create a class component by extending React.Component** in order to create state like this.

```js
class StatefulComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'Marius'
    }
  }
  render() {
    return (
      <div>
        <h1>{this.state.name}</h1>
      </div>
    );
  }
};
```

# Render State in the User Interface

If a component is **stateful**, it will always have access to the data in `state` in its `render()` method. You can access the data with `this.state`.

If you want to access a state value within the `return of the render method`, you have to enclose the value in **curly braces**.

It uses what is called a **virtual DOM**, to keep track of changes behind the scenes. When state data updates, it triggers a re-render of the components using that data - including child components that received the data as a `prop`.

Note that if you make a component stateful, no other components are aware of its state. Its state is completely encapsulated, or local to that component, unless you pass state data to a child component as `props`.

```js
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'freeCodeCamp'
    }
  }
  render() {
    return (
      <div>
        <h1>{this.state.name}</h1>
      </div>
    );
  }
};
```

There is another way to access state in a component. In the `render()` method, before the return statement, you can write JavaScript directly.

For example, you could declare functions, access data from state or props, perform computations on this data, and so on.

Then, you can assign any data to variables, which you have access to in the return statement.

```js
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'freeCodeCamp'
    }
  }
  render() {
    const name = this.state.name
    return (
      <div>
        <h1>{name}</h1>
      </div>
    );
  }
};
```

# Set State with `this.setState`

React provides a method for updating component state called `setState`.

You call the `setState` method within your component class like so: `this.setState()`, passing in an object with key-value pairs. The keys are your `state properties` and the values are the updated state data.

```js
this.setState({
  username: 'Lewis'
});
```

React expects you to never modify state directly, `instead always use this.setState()` when state changes occur.

```js
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: 'Initial State'
    };
    this.handleClick = this.handleClick.bind(this);
  }
  handleClick() {
    this.setState({
      name: 'React Rocks!'
    });
  }
  render() {
    return (
      <div>
        <button onClick={this.handleClick}>Click Me</button>
        <h1>{this.state.name}</h1>
      </div>
    );
  }
};
```
