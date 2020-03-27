import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { StepSwitcherComponent } from './step-switcher.component';

describe('StepSwitcherComponent', () => {
  let component: StepSwitcherComponent;
  let fixture: ComponentFixture<StepSwitcherComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ StepSwitcherComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(StepSwitcherComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
