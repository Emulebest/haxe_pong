package components;

import objects.GameObject;

class Component implements IComponent {
    public var type: String = "component";
    public var attachee: GameObject;
    public function update(dt: Float): Void {
        
    }

    private function new(attachee: GameObject) {
        this.attachee = attachee;
    }
}