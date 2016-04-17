package game;


/**
 * @author Dmitry Velichkevich
 */
interface IReel {
    public function initialize(): Void;

    public function generateTiles(spinResult: List<Tile>): Void;

    public function start(duration: Float): Void;

    public function stop(): Void;

    public function moveTo(position: Float): Void;

    public function setVisibility(visible: Bool): Void;
}
