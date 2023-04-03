import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'devops-labs-frontend';

  private readonly url = environment.PATH_BASE_URL;
  counter: any

  constructor(private http: HttpClient) {}
  ngOnInit(): void {
    this.http.get(`${this.url}/counter`).subscribe(data => {
      this.counter = data;
    })
  }

  test() {
    this.http.post(`${this.url}/counter`, {}).subscribe(data => {
      this.counter = data;
    })

  }

}
