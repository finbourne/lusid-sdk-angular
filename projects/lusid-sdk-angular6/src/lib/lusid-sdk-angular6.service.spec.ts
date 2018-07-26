import { TestBed, inject } from '@angular/core/testing';

import { LusidSdkAngular6Service } from './lusid-sdk-angular6.service';

describe('LusidSdkAngular6Service', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [LusidSdkAngular6Service]
    });
  });

  it('should be created', inject([LusidSdkAngular6Service], (service: LusidSdkAngular6Service) => {
    expect(service).toBeTruthy();
  }));
});
