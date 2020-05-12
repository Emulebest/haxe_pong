package components;

import h2d.Tile;
import h2d.Bitmap;
import objects.GameObject;

class Sprite extends Component {
    public var bitmap: Bitmap;

    public function new(attachee: GameObject) {
        super(attachee);
        type = "sprite";
        bitmap = new Bitmap(Tile.fromColor(0xFF0000, 60, 60));
        bitmap.setPosition(attachee.object.x, attachee.object.y);
        attachee.scene.addChild(bitmap);
    }
}