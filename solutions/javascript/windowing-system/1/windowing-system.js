// @ts-check

export class Size {
  /**
  * @param {number} width
  * @param {number} height
  */
  constructor(width = 80, height = 60){
    this.width = (width < 1) ? 1 : width
    this.height = (height < 1) ? 1 : height
  }

  /**
  * @param {number} width
  * @param {number} height
  */
  resize(width, height){
    this.width = (width < 1) ? 1 : width
    this.height = (height < 1) ? 1 : height
  }
}

export class Position {
  /**
   * 
   * @param {number} x 
   * @param {number} y 
   */
  constructor(x = 0, y = 0){
    this.x = (x < 0) ? 0 : x
    this.y = (y < 0) ? 0 : y
  }

  /**
   * 
   * @param {number} x 
   * @param {number} y 
   * @returns {void}
   */
  move(x, y){
    this.x = (x < 0) ? 0 : x
    this.y = (y < 0) ? 0 : y
  }
}

export class ProgramWindow{
  constructor(){
    this.size = new Size()
    this.position = new Position()
  }

  /**
   * 
   * @param {Size} newSize 
   * @returns {void}
   */
  resize(newSize){
    if(this.position.x + newSize.width > this.screenSize.width){
      this.size.width = this.screenSize.width - this.position.x
    }else{
      this.size.width = newSize.width
    }
    if(this.position.y + newSize.height > this.screenSize.height){
      this.size.height = this.screenSize.height - this.position.y
    }else{
      this.size.height = newSize.height
    }
  }

  /**
   * 
   * @param {Position} newPosition
   * @returns {void} 
   */
  move(newPosition){
    if((newPosition.x + this.size.width) > this.screenSize.width){
      this.position.x = this.screenSize.width - this.size.width
    }else if(newPosition.x < 0){
      this.position.x = 0
    }else{
      this.position.x = newPosition.x
    }
    if((newPosition.y + this.size.height) > this.screenSize.height){
      this.position.y = this.screenSize.height - this.size.height
    }else if(newPosition.y < 0){
      this.position.y = 0
    }else{
      this.position.y = newPosition.y
    }
  }

  get screenSize(){
    return {
      width: 800,
      height: 600
    }
  }
}

/**
 * 
 * @param {ProgramWindow} programWindow 
 * @returns {ProgramWindow}
 */
export function changeWindow(programWindow){
  programWindow.resize(new Size(400, 300))
  programWindow.move(new Position(100, 150))
  return programWindow
}

