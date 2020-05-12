package components;

interface IComponent {
    var type: String;

    public function update(dt: Float): Void;
}