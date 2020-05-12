package objects;

import components.IComponent;
import h2d.Tile;
import h2d.Bitmap;

class GameObject {
    var x: Int;
    var y: Int;
    public var object: h2d.Object;
    public var scene: h2d.Scene;
    var components: List<IComponent> = new List();

    public function new(scene: h2d.Scene, ?x: Int = 0, ?y: Int = 0) {
        this.scene = scene;
        this.object = new h2d.Object();
        this.object.setPosition(x, y);
        this.scene.addChild(this.object);
        Main.objects.push(this);
    }

    public function addComponents(components: List<IComponent>) {
        for (i in components) {
            this.components.add(i);
        }
    }

    public function addComponent(component: IComponent) {
        this.components.add(component);
    }

    public function getComponent(type: String): IComponent {
        var result = this.components.filter(function(comp) return comp.type == type);
        if (!result.isEmpty()) {
            return result.first();
        }
        throw "No Component found.";
    }

    public function update(dt: Float) {
        for (i in components) {
            i.update(dt);
        }
    }
}