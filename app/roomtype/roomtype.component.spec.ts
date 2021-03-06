import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RoomtypeComponent } from './roomtype.component';

describe('RoomtypeComponent', () => {
  let component: RoomtypeComponent;
  let fixture: ComponentFixture<RoomtypeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RoomtypeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RoomtypeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should be created', () => {
    expect(component).toBeTruthy();
  });
});
