package components;

import physics.MovementPhysics;
import objects.GameObject;

class RigidBody extends Component {
    var movementPhysics: MovementPhysics;


    public function new<T>(attachee: GameObject, movementType: MovementType<T>) {
        super(attachee);
        type = "rigid body";
        movementPhysics = MovementFactory.create(movementType);
    }

    public function stop() {
        movementPhysics.stop();
    }

    public function invertMovement() {
        movementPhysics.invertMovement();
    }

    public override function update(dt: Float) {
        var sprite = cast(this.attachee.getComponent("sprite"), Sprite);
        movementPhysics.update(dt, sprite);
    }
}